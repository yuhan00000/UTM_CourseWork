#include <iostream>
using namespace std;

int main()
{
   	int number;
   	
   	cout << "Enter an integer number: ";
   	cin >> number;
   	
   	int product = 1;
   	
   	while (number!=0)
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
	
	if ((product%4==0)&&(product%5==0)&&(product%7==0))
	    {
		cout << product <<" is multiples of 4,5 and 7" << endl;
	    }
	    
	else if ((product%4==0)&&(product%7==0))
	    {
	    cout << product <<" is multiples of 4 and 7" << endl;
		}
		
	else if ((product % 5 == 0) && (product % 7 == 0))
	    {
	   	cout << product <<" is multiples of 5 and 7" << endl;
		}
		
	else if ((product % 4 == 0) && (product % 5 == 0))
	    {
	    cout << product <<" is multiples of 4 and 5" << endl;
		}
		
	else if (product % 4 == 0)
	    {
	   	cout << product <<" is a multiple of 4" << endl;
	    }
	
	else if (product % 5 == 0)
	    {
	   	cout << product <<" is a multiple of 5" << endl;
	    }
	   
	else if (product % 7 == 0)
	    {
	   	cout << product <<" is a multiple of 7" << endl;
	    }
	
	
return 0;
}
	

