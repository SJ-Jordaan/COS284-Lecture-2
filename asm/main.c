#include <stdio.h>

// Declare the assembly functions
extern void encrypt(char* str, char* key);
extern void decrypt(char* str, char* key);

int main() {
    // Initialize a plaintext string and a key
    char str[] = "abcd";
    char key[] = "key1";

    // Display the original string
    printf("Original string: %s\n", str);

    // Encrypt the string
    // mov rdi, str
    // mov rsi, key
    // jmp encrypt
    encrypt(str, key);

    // Display the encrypted string
    printf("Encrypted string: %s\n", str);

    // Decrypt the string
    decrypt(str, key);

    // Display the decrypted string
    printf("Decrypted string: %s\n", str);

    return 0;
}