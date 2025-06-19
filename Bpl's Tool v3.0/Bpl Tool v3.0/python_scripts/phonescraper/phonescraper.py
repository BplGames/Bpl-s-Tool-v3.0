import re
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

def search_email(email):
    query = f'"{email}" phone'
    return f'https://www.duckduckgo.com/?q={query}&ia=web'

def extract_phone_numbers(text):
    # Prosty wzorzec numeru telefonu
    phone_pattern = re.compile(r'(\+?\d[\d\s\-\(\)]{7,}\d)')
    return phone_pattern.findall(text)

def email_to_phone(email):
    print(f"\n[+] Szukam numerów telefonu powiązanych z: {email}")
    
    url = search_email(email)
    
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument("--log-level=3")

    try:
        driver = webdriver.Chrome(options=options)
        driver.get(url)
        time.sleep(2)  # Czekaj na załadowanie strony

        # Pobierz cały tekst z ciała strony
        page_text = driver.find_element(By.TAG_NAME, 'body').text

        # Szukaj numerów telefonu
        phones = extract_phone_numbers(page_text)
        if phones:
            print("[+] Znalezione numery telefonu:")
            for phone in phones:
                print(f"   🔹 {phone}")
        else:
            print("[-] Nie znaleziono żadnych numerów telefonu.")
    except Exception as e:
        print(f"[!] Błąd: {e}")
    finally:
        driver.quit()

if __name__ == "__main__":
    print("=== EMAIL ➜ PHONE LOOKUP ===")
    email = input("Podaj email: ").strip()
    email_to_phone(email)
