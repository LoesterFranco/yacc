//Apr.1.2005 for ram16k
//count_tak.c




#define print_port 0x3ff0
#define print_char_port 0x3ff1
#define print_int_port 0x3ff2
#define print_long_port 0x3ff4





#define uart_port		0x03ffc //for 16KRAM
#define uart_wport uart_port
#define uart_rport uart_port
#define int_set_address 0x03ff8 //for 16KRAM



char *name[]={
   "","one","two","three","four","five","six","seven","eight","nine",
   "ten","eleven","twelve","thirteen","fourteen","fifteen",
      "sixteen","seventeen","eighteen","nineteen",
   "","ten","twenty","thirty","forty","fifty","sixty","seventy",
      "eighty","ninety"
};
void print_uart(unsigned char* ptr)// 
{
	unsigned int uport;
	#define WRITE_BUSY 0x0100


	while (*ptr) {
	
		do {
		  uport=*(volatile unsigned*)	uart_port;
		} while (uport & WRITE_BUSY);
		*(volatile unsigned char*)uart_wport=*(ptr++);
	}
	//*(volatile unsigned char*)uart_wport=0x00;//Write Done
}	


void putc_uart(unsigned char c)// 
{
	unsigned int uport;
	

	do {
		  uport=*(volatile unsigned*)	uart_port;
	} while (uport & WRITE_BUSY);
	*(volatile unsigned char*)uart_wport=c;
	
}	

unsigned char read_uart()//Verilog Test Bench Use 
{
		unsigned uport;
		uport= *(volatile unsigned *)uart_rport;
		return uport;
}	

void print(unsigned char* ptr)//Verilog Test Bench Use 
{

	while (*ptr) {
	
		*(volatile unsigned char*)print_port=*(ptr++);
	}

	*(volatile unsigned char*)print_port=0x00;//Write Done

}






char *itoa(unsigned long num)
{
   static char buf[12];
   int i;
   buf[10]=0;
   for(i=9;i>=0;--i) {
      buf[i]=(char)((num%10)+'0');
      num/=10;
   }
   return buf;
}

void number_text(unsigned long number)
{
   int digit;
   print_uart(itoa(number));
   print_uart(": ");
   if(number>=1000000000) {
      digit=number/1000000000;
      print_uart(name[digit]);
      print_uart(" billion ");
      number%=1000000000;
   }
   if(number>=100000000) {
      digit=number/100000000;
      print_uart(name[digit]);
      print_uart(" hundred ");
      number%=100000000;
      if(number<1000000) {
         print_uart("million ");
      }
   }
   if(number>=20000000) {
      digit=number/10000000;
      print_uart(name[digit+20]);
      putc_uart(' ');
      number%=10000000;
      if(number<1000000) {
         print_uart("million ");
      }
   }
   if(number>=1000000) {
      digit=number/1000000;
      print_uart(name[digit]);
      print_uart(" million ");
      number%=1000000;
   }
   if(number>=100000) {
      digit=number/100000;
      print_uart(name[digit]);
      print_uart(" hundred ");
      number%=100000;
      if(number<1000) {
         print_uart("thousand ");
      }
   }
   if(number>=20000) {
      digit=number/10000;
      print_uart(name[digit+20]);
      putc_uart(' ');
      number%=10000;
      if(number<1000) {
         print_uart("thousand ");
      }
   }
   if(number>=1000) {
      digit=number/1000;
      print_uart(name[digit]);
      print_uart(" thousand ");
      number%=1000;
   }
   if(number>=100) {
      digit=number/100;
      print_uart(name[digit]);
      print_uart(" hundred ");
      number%=100;
   }
   if(number>=20) {
      digit=number/10;
      print_uart(name[digit+20]);
      putc_uart(' ');
      number%=10;
   }
   print_uart(name[number]);
   putc_uart('\r');
   putc_uart('\n');
}

void main()
{
   unsigned long number,i;
#ifdef RTL_SIM
	print("This program is based on Steve Rhoards-san,author of plasma.\n");

#endif
   print_uart("Mult by 3\r\n");
 //  for (i=0;i<3;i=i+1)   print_uart("uart port test\n");
   number=3;
   for(i=0;;++i) {
      number_text(number);
      number*=3;
      #ifdef RTL_SIM
        if (i==18){
			print(" ");//flush	
        	print("$finish");
        	
        }	
	  #endif
 
   }
}

