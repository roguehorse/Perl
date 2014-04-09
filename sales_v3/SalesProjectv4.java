/*
 * PRG/420
 * Week 4 project
 * Due/8/26/13
 * 
 * Main program
 * 
 * 
 * Modify the Week Three Java™ application using Java™ NetBeans™ IDE to meet these additional and changed business requirements:

 * The application will now compare the total annual compensation of at least two salespersons.

 * It will calculate the additional amount of sales that each salesperson must achieve to match or exceed the higher of the two earners.

 * The application should ask for the name of each salesperson being compared. 

 * The Java™ application should also meet these technical requirements:

 * The application should have at least one class, in addition to the application’s controlling class.
 * The source code must demonstrate the use of Array or ArrayList.
 * There should be proper documentation in the source code.
 * Submit your program along with the screen shot.
 */
package salesprojectv4;
import java.text.*;

/**
 *
 * @author Scott DuBois aka Roguehorse
 */
public class SalesProjectv4 
{

    /**
     * @param args the command line arguments
     */
    
    //Create variable salary and assign new object Base from class Base
    private static Basev4 salary = new Basev4();
    private static Names naming = new Names();
    private static Annual eaSales = new Annual();
  
    public static void main(String[] args) 
    {
        NumberFormat fmt = NumberFormat.getCurrencyInstance();
       
        double gross; //Create variable for base gross ( both sales people )
        double gross1; //Create variable for base * .07 incentive for sales person 1
        double gross2; //Create variable for base * (.07 + .015) incentive for sales person 1
        
        double gross4; //Create variable for base * .07 incentive for sales person 2
        double gross5; //Create variable for base * (.07 + .015) incentive for sales person 2
              
        double table1; //Assign salesperson1 amount value to variable table1
        double table2; //Assign salesperson2 amount value to variable table2
        
        double salesdiff1; //Variable assigned if sales person 1 is > 2
        double salesdiff2; //Variable assigned if sales person 2 is > 1
        
        //Description of gross income with incentive
        description();
          
        naming.NameInput(); //Input salespersons names 
       
        eaSales.AnnualInput(); //Input sales values for each
               
        /*********CALCULATION VALUES ASSOCIATED TO DECLARED VARIABLES******************/
        
        //String tableoneformat = fmt.format(table1);           
        table1 = eaSales.asales.get(0); //Assign salesperson1 amount value to variable table1
        table2 = eaSales.asales.get(1); //Assign salesperson2 amount value to variable table2

        
        //Calculate gross from sales value x 7% + base of $75,000       
        gross = (Double)(salary.baseSalary());
        gross1 = (Double)(eaSales.asales.get(0) * salary.pIncentive() + salary.baseSalary());
        gross4 = (Double)(eaSales.asales.get(1) * salary.pIncentive() + salary.baseSalary());
        
        //Calculate gross from sales value x 7% + base of $75,000       
        gross2 = (Double)(eaSales.asales.get(0) * (salary.pIncentive() + salary.goalAccel()) + salary.baseSalary());
        gross5 = (Double)(eaSales.asales.get(1) * (salary.pIncentive() + salary.goalAccel()) + salary.baseSalary());
        
        salesdiff1 = (Double)(eaSales.asales.get(0) - eaSales.asales.get(1));
        salesdiff2 = (Double)(eaSales.asales.get(1) - eaSales.asales.get(0));
        
/***********DETERMINE IF EITHER SALES PERSON WIL RECEIVE BONUSES***************/        

/*************CALCULATE IF SALES PERSON 1 WILL RECEIVE BONUSES*****************/
        
        //Determine is salesperson 1 has reached $120,000 sales goal
        for (int sp1=1; sp1<2; sp1++)
         if (eaSales.asales.get(0) >= salary.salesGoal())
         {
            System.out.println("====================================================================================");
            String A = "Bonuses will be awarded to   >>   ";
            System.out.printf("%52s",A);
             System.out.print(naming.names.get(0));
            System.out.println();
            String B = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",B);
            System.out.print(fmt.format(gross2));
            System.out.println();
         }
         
        //Determine if salesperson 1 has met 80% incentive requirement
         else if (eaSales.asales.get(0) >= salary.startIncentive() * salary.salesGoal() && eaSales.asales.get(0) < salary.salesGoal())
         {
            System.out.println("====================================================================================");
            String C = "A sales bonus will be awarded to   >>   ";
            System.out.printf("%52s",C);
            System.out.print(naming.names.get(0));
            System.out.println();
            String D = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",D);
            System.out.print(fmt.format(gross1));
            System.out.println();
         }
         
        //Results if salesperson 1 incentive minimum has not been reached
         else
         {
            System.out.println("====================================================================================");
            String E = "No sales bonus will be awarded to   >>   ";
            System.out.printf("%52s",E);
            System.out.print(naming.names.get(0));
            System.out.println();
            String G = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",G);
            System.out.print(fmt.format(gross));
            System.out.println();
         }
        
/**************CALCULATE IF SALES PERSON 2 WILL RECEIVE BONUSES****************/
        
        //Determine is salesperson 2 has reached $120,000 sales goal
        for (int sp2=1; sp2<2; sp2++)
         if (eaSales.asales.get(1) >= salary.salesGoal())
         {
            System.out.println("====================================================================================");
            String H = "Bonuses will be awarded to   >>   ";
            System.out.printf("%52s",H);
             System.out.print(naming.names.get(1));
            System.out.println();
            String I = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",I);
            System.out.print(fmt.format(gross5));
            System.out.println();
         }
        
         //Determine if salesperson 2 has met 80% incentive requirement
         else if (eaSales.asales.get(1) >= salary.startIncentive() * salary.salesGoal() && eaSales.asales.get(1) < salary.salesGoal())
         {
            System.out.println("====================================================================================");
            String J = "A sales bonus will be awarded to   >>   ";
            System.out.printf("%52s",J);
            System.out.print(naming.names.get(1));
            System.out.println();
            String K = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",K);
            System.out.print(fmt.format(gross4));
            System.out.println();
         }
        
         //Results if salesperson 2 incentive minimum has not been reached
         else
         {
            System.out.println("====================================================================================");
            String L = "No sales bonus will be awarded to   >>   ";
            System.out.printf("%52s",L);
            System.out.print(naming.names.get(1));
            System.out.println();
            String M = "Gross income earned will be   >>   ";
            System.out.println();
            System.out.printf("%52s",M);
            System.out.print(fmt.format(gross));
            System.out.println();
         }
        
/**************************DIFFERENCE IN SALES COMPARISON**********************/
        
System.out.println("=====================================================================================");

            //Determine if sales person 1 generates more than 2
            if (eaSales.asales.get(0) > eaSales.asales.get(1))
            {
               String diff1 = " ";
               System.out.printf("%15s",diff1);
               System.out.print(naming.names.get(1));
               System.out.print(" must earn " + fmt.format(salesdiff1) + " more to match ");
               System.out.print(naming.names.get(0));
               System.out.println();
            }
            
            //Determine if sales person 2 generates more than 1
            else if (eaSales.asales.get(1) > eaSales.asales.get(0))
            {
               String diff1 = " ";
               System.out.printf("%15s",diff1);
               System.out.print(naming.names.get(0));
               System.out.print(" must earn " + fmt.format(salesdiff2) + " more to match ");
               System.out.print(naming.names.get(1));
               System.out.println();
            }
            
            //Determine if sales person 2 generates the same as 1
            else
            {
               String diff1 = " ";
               System.out.printf("%15s",diff1);
               System.out.print(naming.names.get(0));
               System.out.print(" has earned the same amount as ");
               System.out.print(naming.names.get(1));
               System.out.println();
            }        
        
/***********************CREATE TABLES FOR FIRST SALES PERSON*******************/        
             
        //Create table header before calculation insertions
            System.out.println("====================================================================================");
            String N1 = "Possible compensation for   >>   ";
            System.out.printf("%52s",N1);
            System.out.print(naming.names.get(0));
            System.out.println();
            System.out.println();
            String H1 = "Total Sales  |  Total Compensation";               
            System.out.printf("%55s",H1);
            System.out.println();
            System.out.println("------------------------------------------------------------------------------------");
            
 /**CALCULATE TABLE VALUES BASED ON SALES PERFORMANCE FROM FIRST SALES PERSON**/ 
            
//Create ArrayList based on sales input then return results adding $5000 until 50% above sales
        while (table1 < eaSales.asales.get(0) * salary.tLength())
        {
    
            //Determine if table variable is greater than $120,000
            if (table1 >= salary.salesGoal())
            {
                //Variable gross2 receives value table(salary) x (.07 + .015) + 75000
                gross2 = (Double)(table1 * (salary.pIncentive() + salary.goalAccel()) + salary.baseSalary());
                String T1 = " ";
                System.out.printf("%21s",T1);
                System.out.printf(fmt.format(table1) + "         " + fmt.format(gross2));
                table1 = table1 + 5000;
                System.out.println();
            }
            
            //Determine if table valuie is greater than 80% of $120000 and less than $120000
            else if (table1 >= salary.startIncentive() * salary.salesGoal() && table1 < salary.salesGoal())
            {
                //Variable gross1 receives value table(salary) x .07 + 75000
                gross1 = (Double)(table1 * salary.pIncentive() + salary.baseSalary());
                if (table1 <= 99999)//Determines if value is less than 5 digits to correct formatting
                { 
                    String T1 = " ";
                    System.out.printf("%21s",T1);
                    System.out.printf(fmt.format(table1) + "          " + fmt.format(gross1));
                    table1 = table1 + 5000; //Add $5000 to table value to derive gross1 value
                    System.out.println();
                }
                
                else
                {
                    String T1 = " ";
                    System.out.printf("%21s",T1);
                    System.out.printf(fmt.format(table1) + "         " + fmt.format(gross1));
                    table1 = table1 + 5000; //Add $5000 to table value to derive gross1 value
                    System.out.println();
                }
            }
            
            //If previous two conditions are false then execute this condition
            else
            {
                //Assign base salary value to gross variable for use in table
                gross = salary.baseSalary();
                
                if (table1 <= 99999)//Determines if value is less than 5 digits to correct formatting
                {
                   String T1 = " ";
                   System.out.printf("%21s",T1); 
                   System.out.printf(fmt.format(table1) + "          " + fmt.format(gross)); 
                   table1 = table1 + 5000; //Add $5000 to table value to derive gross value
                   System.out.println();
                }
                
                else
                {
                   String T1 = " ";
                   System.out.printf("%21s",T1);
                   System.out.printf(fmt.format(table1) + "         " + fmt.format(gross));
                   table1 = table1 + 5000;//Add $5000 to table value to derive gross value
                   System.out.println();
                }
            }
        }//End table creation for salesperson 1                      
        
/**********************CREATE TABLES FOR SECOND SALES PERSON*******************/        
             
            //Create table header before calculation insertions
            System.out.println("====================================================================================");
            String N2 = "Possible compensation for   >>   ";
            System.out.printf("%52s",N2);
            System.out.print(naming.names.get(1));
            System.out.println();
            System.out.println();
            String H2 = "Total Sales  |  Total Compensation";               
            System.out.printf("%55s",H2);
            System.out.println();
            System.out.println("------------------------------------------------------------------------------------");
        
/**CALCULATE TABLE VALUES BASED ON SALES PERFORMANCE FROM SECOND SALES PERSON**/
        
//Create ArrayList based on sales input then return results adding $5000 until 50% above sales  
        while (table2 < eaSales.asales.get(1) * salary.tLength())
        {
            //Determine if table variable is greater than $120,000
            if (table2 >= salary.salesGoal())
            {
                //Variable gross2 receives value table(salary) x (.07 + .015) + 75000
                gross5 = (Double)(table2 * (salary.pIncentive() + salary.goalAccel()) + salary.baseSalary());
                String T2 = " ";
                System.out.printf("%21s",T2);
                System.out.printf(fmt.format(table2) + "         " + fmt.format(gross5));
                table2 = table2 + 5000;//Add $5000 to table value to derive gross5 value
                System.out.println();
            } 
            
            //Determine if table valuie is greater than 80% of $120000 and less than $120000
            else if (table2 >= salary.startIncentive() * salary.salesGoal() && table2 < salary.salesGoal())
            {
                //Variable gross4 receives value table(salary) x .07 + 75000 
                gross4 = (Double)(table2 * salary.pIncentive() + salary.baseSalary());
                
                if (table2 <= 99999)//Determines if value is less than 5 digits to correct formatting
                { 
                    String T2 = " ";
                    System.out.printf("%21s",T2);
                    System.out.printf(fmt.format(table2) + "          " + fmt.format(gross4));
                    table2 = table2 + 5000; //Add $5000 to table value to derive gross4 value
                    System.out.println();
                }
                
                else
                {
                    String T2 = " ";
                    System.out.printf("%21s",T2);
                    System.out.printf(fmt.format(table2) + "         " + fmt.format(gross4));
                    table2 = table2 + 5000; //Add $5000 to table value to derive gross4 value
                    System.out.println();
                }
            }
            
            //If previous two conditions are false then execute this condition
            else
            {
                //Assign base salary value to gross variable for use in table
                gross = salary.baseSalary();
                
                if (table2 <= 99999)//Determines if value is less than 5 digits to correct formatting
                {
                   String T2 = " ";
                   System.out.printf("%21s",T2); 
                   System.out.printf(fmt.format(table2) + "          " + fmt.format(gross)); 
                   table2 = table2 + 5000;//Add $5000 to table value to derive gross value
                   System.out.println();
                }
                
                else
                {
                   String T2 = " ";
                   System.out.printf("%21s",T2);
                   System.out.printf(fmt.format(table2) + "        " + fmt.format(gross));
                   table2 = table2 + 5000;//Add $5000 to table value to derive gross value
                   System.out.println();
                }
            }            
        }//End table creation for salesperson2
        System.out.println("=====================================================================================");
    }//End Main
        
    public static void description() //Description of annual salary determination
    {
        System.out.println("=====================================================================================");
        System.out.println("  Gross salary is determined by adding base salary to annual sales incentive value");//Salary explanation
        System.out.println("       A bonus incentive value will be added to sales that exceed the goal!");//Define there is an incentive accelerator
        System.out.println("                    >>> PRESS RETURN AFTER EACH ENTRY <<<\n");
         System.out.printf("               Base salary is                  >>   $%,.2f\n",salary.baseSalary());//Define base salary value
         System.out.printf("               Incentive percentage value is   >>   %.2f\n",salary.pIncentive());//Define sales incentive value
         System.out.printf("               Incentives begin at             >>   %.2f\n",salary.startIncentive());//Define when incentive kicks in
         System.out.printf("               Sales goal is set at            >>   $%,.2f\n",salary.salesGoal());//Define the sales goal value
        System.out.println("====================================================================================\n");
    }
}//End of class SalesProjectv4

/**Algorithm for SalesProjectv4
 * 
 * *Define conditions of annual salary**
 *      Base salary starts @ $75,000
 *      Sales target = $120,000
 * 
 * *Ask for names of two sales persons**
 *      Input names into ArrayList 1
 * 
 * *Ask for each person sales**
 *      Input sales into ArrayList 2
 *          !! Validate input !!
 * 
 * *Compare values of each person**
 * 
 * *Incentive starts at 80% of target**
 *      If 120000 * .8 = true
 *      then return value @ .07 * sales value
 * 
 * *Incentive multiplier value**
 *      If >= 120000 = true
 *      then return value (.07 + .015) * sales value
 * 
 * *No bonus**
 *      If 120000 * .8 = false
 *      then return value salary un-modified
 * 
 ** Compare values of each person**
 *      Return the difference and requirements to match
 * 
 * *Possible salary table for each person**
 *      while print sales earned + 5000
 *      until sales earned = sales earned * 1.5
 * 
 */
            