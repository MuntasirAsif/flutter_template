import os
import re
import json
from deep_translator import GoogleTranslator

PROJECT_PATH = "lib"
OUTPUT_DIR = "lib/core/gen/l10n"
# Regex to match any string literal
STRING_REGEX = r"""(?:'([^'\\]*(?:\\.[^'\\]*)*)'|"([^"\\]*(?:\\.[^"\\]*)*)")"""

def should_ignore(text):
    text = text.strip()
    if len(text) < 2: # Ignore single chars
        return True
    if "${" in text: # Ignore interpolated
        return True
    if text.startswith(("http", "https:", "package:", "dart:", "assets/")):
        return True
    if re.search(r'\.(png|jpg|jpeg|svg|json|mp4|ttf|otf|dart|arb)$', text, re.IGNORECASE): # Ignore extensions
        return True
    
    # Ignore identifiers: no spaces AND (contains underscore OR is camelCase with multiple caps)
    if " " not in text:
        # If it has underscores, it's likely a key
        if "_" in text:
            return True
        # If it's camelCase (has uppercase NOT at the start), it's likely a variable
        if any(c.isupper() for c in text[1:]):
            return True
        # If it's all lowercase and longer than 5, it might be a key
        if text.islower() and len(text) > 8:
            return True
    
    return False

def extract_strings(filepath):
    print(f"Scanning: {filepath}")
    found = []
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            for line in f:
                stripped = line.strip()
                # Skip import/export lines and comments
                if stripped.startswith(("import ", "export ", "//", "///", "part ")):
                    continue
                matches = re.findall(STRING_REGEX, line)
                for m in matches:
                    val = m[0] or m[1]
                    if val and not should_ignore(val):
                        found.append(val)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
    return found

def generate_key(text):
    # Replace invalid characters with underscore
    key = re.sub(r'[^a-zA-Z0-9]', '_', text.lower())
    # Remove leading/trailing underscores and duplicate underscores
    key = re.sub(r'_+', '_', key).strip('_')
    
    # If key becomes empty (e.g. was all special chars like "30 ₫"), fallback
    if not key:
        key = "text"
    
    # If key starts with a digit, prefix with s_
    if key[0].isdigit():
        key = f"s_{key}"
        
    # Validation: Ensure key starts with letter/underscore (already handled by s_ prefix if digit)
    # Double check it doesn't start with invalid char after processing
    if not re.match(r'^[a-zA-Z_]', key):
         key = f"s_{key}"

    # Truncate length
    key = key[:50]
    
    # Check if truncated key ends with underscore (ugly)
    key = key.strip('_')
    
    # Dart keywords blacklist
    keywords = {
        "abstract", "as", "assert", "async", "await", "break", "case", "catch",
        "class", "const", "continue", "covariant", "default", "deferred", "do",
        "dynamic", "else", "enum", "export", "extends", "extension", "external",
        "factory", "false", "final", "finally", "for", "function", "get", "hide",
        "if", "implements", "import", "in", "interface", "is", "library", "mixin",
        "new", "null", "on", "operator", "part", "rethrow", "return", "set",
        "show", "static", "super", "switch", "sync", "this", "throw", "true",
        "try", "typedef", "var", "void", "while", "with", "yield"
    }
    
    if key in keywords:
        key = f"k_{key}"
        
    return key[:50]

def translate_text(text, target_lang="vi"):
    try:
        return GoogleTranslator(source="en", target=target_lang).translate(text)
    except Exception as e:
        print(f"Translation failed for '{text}': {e}")
        return text

def main():
    import sys
    sys.stdout.reconfigure(encoding='utf-8')

    all_strings = []

    for root, dirs, files in os.walk(PROJECT_PATH):
        # Exclude l10n directory and hidden directories
        if "l10n" in dirs:
            dirs.remove("l10n")
        
        # Also exclude generated files if any exist elsewhere
        if "generated" in root:
            continue

        for file in files:
            if file.endswith(".dart") and not file.endswith(".g.dart") and not file.endswith(".freezed.dart"):
                path = os.path.join(root, file)
                all_strings.extend(extract_strings(path))

    unique_strings = list(set(all_strings))
    
    # Load existing ARB files if they exist
    en_arb_path = os.path.join(OUTPUT_DIR, "app_en.arb")
    vi_arb_path = os.path.join(OUTPUT_DIR, "app_vi.arb")
    
    if os.path.exists(en_arb_path):
        with open(en_arb_path, "r", encoding="utf-8") as f:
            en_arb = json.load(f)
    else:
        en_arb = {"@@locale": "en"}
        
    if os.path.exists(vi_arb_path):
        with open(vi_arb_path, "r", encoding="utf-8") as f:
            vi_arb = json.load(f)
    else:
        vi_arb = {"@@locale": "vi"}

    # Track which texts are already in en_arb to avoid re-translation
    existing_texts = {val: key for key, val in en_arb.items() if not key.startswith("@")}
    
    new_found = 0
    for text in unique_strings:
        if text in existing_texts:
            continue
            
        key = generate_key(text)
        counter = 1
        original_key = key
        while key in en_arb:
            key = f"{original_key}_{counter}"
            counter += 1

        en_arb[key] = text
        en_arb[f"@{key}"] = {"description": f"Auto extracted: {text}"}

        translated = translate_text(text, "vi")
        vi_arb[key] = translated
        vi_arb[f"@{key}"] = {"description": f"Vietnamese auto of: {text}"}
        
        new_found += 1
        print(f"New: {text} -> {translated}")

    if new_found > 0:
        os.makedirs(OUTPUT_DIR, exist_ok=True)
        with open(en_arb_path, "w", encoding="utf-8") as f:
            json.dump(en_arb, f, indent=2, ensure_ascii=False)
        with open(vi_arb_path, "w", encoding="utf-8") as f:
            json.dump(vi_arb, f, indent=2, ensure_ascii=False)
        print(f"✅ ARB files updated with {new_found} new strings.")
    else:
        print("No new strings found.")

if __name__ == "__main__":
    main()
