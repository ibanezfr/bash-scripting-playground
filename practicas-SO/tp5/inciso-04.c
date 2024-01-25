#include <stdio.h>
#include <stdlib.h>

int main() {
   // system("free -h > Informe_de_RAM.txt");

   // printf("Informe de RAM generado con éxito. Verifica el archivo 'Informe");
   // printf("_de_RAM.txt\n");

    FILE *informeFile = fopen("Informe_de_RAM.txt", "w");

    if (informeFile == NULL) {
        fprintf(stderr, "Error al abrir el archivo para escribir.\n");
        return 1;
    }

    FILE *freeCommand = popen("free -h", "r");

    if (freeCommand == NULL) {
        fprintf(stderr, "Error al ejecutar el comando free.\n");
        fclose(informeFile);
        return 1;
    }

    char buffer[256];

    while (fgets(buffer, sizeof(buffer), freeCommand) != NULL) {
        if (buffer[0] == 'M' && buffer[1] == 'e' && buffer[2] == 'm') {
            break;
        }
    }

    char label[10];
    float total, used, free;

    sscanf(buffer, "%s %fGi %fGi %fGi", label, &total, &used, &free);

    fprintf(informeFile, "\na) Total de memoria del sistema:\t%.1f GB\n", total);
    fprintf(informeFile, "b) Total de memoria usada:\t\t%.1f GB\n", used);
    fprintf(informeFile, "C) Total de memoria libre:\t\t%.1f GB\n\n", free);

    fclose(informeFile);
    pclose(freeCommand);

    printf("Informe de RAM generado con éxito. Verifica el archivo ");
    printf("'Informe_de_RAM.txt'.\n");

    return 0; 
}
