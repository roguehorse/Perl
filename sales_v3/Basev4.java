/*
 * PRG/420
 * Week 4 project
 * Due 8/26/13
 * 
 * Supporting Class files
 * 
 */
package salesprojectv4;
import java.util.*;
import java.text.*;
/**
 *
 * @author Scott DuBois aka Roguehorse
 */
public class Basev4 
{
     double s = 75000; //Adjust this value when setting BASE SALARY
     double g = 120000; //Adjust this value to set SALES GOAL
     double p = .07; //Adjust this value when setting INCENTIVE PERCENTAGE
     double i = .80; //Adjust this value to determine INCENTIVE START
     double m = .015; //Adjust this value for BONUS ACCELERATOR
     double t = 1.5; //Adjust this value to modify TABLE PRINT LENGTH MULTIPLIER
     
   double baseSalary()//Base salary variable set   
    {
       double bSalary = s;//Base salary value !!Change value above only!!
       return bSalary;
    }
   
    double pIncentive()//Incentive percentage variable set         
    {
        double percent = p;//incentive percentage !!Change value above only!!
        return percent;
    }
    
    double startIncentive()//Sales incentive initiation value
    {
        double startincent = i;//incentive start !!Change value above only!!
        return startincent;
    }
    
    double salesGoal()//Sales goal value
    {
        double goal = g;//sales goal level !!Change value above only!!
        return goal;
    }
    
    double goalAccel()//Sales goal acceleration value
    {
        double goalaccel = m;//sales goal acceleration !!Change value above only!!
        return goalaccel;
    }
    
    double tLength()//Sets table print length value
    {
        double ptable = t;//Sets table print length variable !!Change value above only!!
        return ptable;
    }
}

/**********************COLLECT NAMES OF SALES PERSONS**************************/
class Names
{
 ArrayList<String> names = new ArrayList<>();//Collect names of two salespeople in an ArrayList
 Scanner input = new Scanner ( System.in );//Invoke scanner to collect input

   public void NameInput()
    {
      for (int x=1; x<3; x++)//Loop until both names are entered into ArrayList
      {
        String sp1 = "Please enter saleperson " + x + " first name   >>   ";
        System.out.printf("%52s",sp1);
        names.add(input.next());
      }
      System.out.println();
    }
}

/**************COLLECT ANNUAL SALES AMOUNTS FROM SALES PERSONS*****************/
class Annual
{
 ArrayList<String> names = new ArrayList<>();    
 ArrayList<Double> asales = new ArrayList<>();
 Scanner input = new Scanner ( System.in );

   public void AnnualInput()
    {
       double z;//Assign variable for validation loop prior to assigning to ArrayList
       for (int x=1; x<3; x++)//Loop twice for two sales people
       {
        String sp2 = "Please enter saleperson " + x + " sales   >>   $";
        System.out.printf("%53s",sp2);
        z = input.nextDouble();//Assign input to variable
        if (z <= 0)//Determine if variable holds a valid input
        {
            String validate1 = "!!  Please enter a value greater than 0  !!";//Ask for valid input
            System.out.printf("%73s",validate1);
            System.out.println();
            x = x-1;//Remove one from loop counter until input is valid
        }
        
        else
        {
           asales.add(z);//Add input from variable to ArrayList once validated
        }
        
       }
       System.out.println();
    }   
}

