void printf(char* str)
{
    unsigned short* VideoMemory = (unsigned short*)0xB8000;

    for(int i=0;str[i]!='\0';++i)
    {
        videoMemory[i]= (videoMemory[i] & 0xFF00) | str[i];
    }
}

void kernelMain(void* multiboot_structure, unsigned int magicnumber)
{
    printf("Welcome to Yash's OS");
    while(1);
}