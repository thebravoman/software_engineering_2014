  #include <stdio.h> //p-broi kolko delitelya ima
                      //n-deliteli
	void main ()
{
	int x,y,i,n,p;
p=0; 
printf ("Vuvedi 1-voto chislo ");

	scanf("%d",&x);

printf("Vuvedi 2-roto chislo ");

	scanf("%d",&y);
if (x>y) 
	printf("ne moje");
else 
 	for (i=x;i<=y;i++)  { 
          
 	 for (n=1;n<=i;n++) {
      
 if (i%n==0) p++ ; 

 if ((p<=2) && (i%10==3)) 

printf("%d",i) ; } }  

} 
