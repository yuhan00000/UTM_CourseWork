#include <iostream>
using namespace std;

int main()
{
   	int number, product=1;
   	
   	cout << "Enter an integer number: ";
   	cin >> number;
   	
	
   	do
   	{
   	    product *= (number % 10);
	   	cout << number % 10;
	   	number = number / 10;	
	
	    if (number!=0)
	    {
	    	cout << " * ";
		}
		
	    else
	    {
	    	cout << " = " << product << endl;
	    }

    }
    while (number !=0);
	
	if (product % 2 == 0) 
	    {
        cout << product << " is an even number " ;
        } 
	else 
	    {
        cout << product << " is an odd number " ;
        }
    
    
	if ((product % 3 == 0) && (product % 5 == 0))
	    {
		cout << "& multiples of 3 and 5" << endl;
	    }
	    
	else if (product % 3 == 0)
	    {
	    cout << "& multiples of 3" << endl;
		}
		
	else if (product % 5 == 0) 
	    {
	   	cout << "& multiples of 5 " << endl;
		}
		
		
return 0;
}
