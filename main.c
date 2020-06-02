#include<reg51.h>
unsigned char s[7]="152241";
int i=0;
sbit rfid=P1^3;
unsigned char count=6;
unsigned char jishu=1;
int flag=1;
void main()
{	
	rfid=1;
	TMOD=0x20;
	SCON=0x50;//01010000
	TH1=TL1=230;
	ES=EA=TR1=1;
	//SBUF=p[0];
	while(1)
	{
		if(rfid==0&&flag==1){
			flag=0;
			for(count=0;count<6;count++)
		{
			SBUF=s[count];
			s[count]+=jishu;
			if(s[count]-1=='9')
					s[count]='0';
			while(!TI);
			//TI=0;
		}
		}
	else if(rfid==1){
		flag=1;
	}
	
	}
	
}

void serialproc()interrupt 4
{
	
	if(TI)
	{
		TI=0;	
	}
}

