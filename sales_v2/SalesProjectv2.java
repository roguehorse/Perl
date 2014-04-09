/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package salesprojectv2;
import java.util.*; //Scanner class call for user input

/**
 *
 * @author Scott DuBois aka Roguehorse
 */
class SalesProjectv2 
{

    /**
     * @param args the command line arguments
     */
    
    public static void main(String[] args) 
    {
         //Call scanner into variable input
        Scanner input = new Scanner ( System.in ); 
        
        //Create variable salary and assign new object Base from class Base
        Basev2 salary = new Basev2();
                
        double sales; //Create variable sales
        double gross; //Create variable for base gross
        double gross1; //Create variable gross w/incentive
        double gross2; //Create variable gross w/incentive multiplier
        double table; //Create variable for salary table calculations
          
        //Description of gross income with incentive
        salary.description();
        //Collect input value into variable sales
        sales = input.nextDouble();
        table = sales; //Assign sales input value to variable table 
        //Calculate gross from sales value x 7% + base of $75,000       
        gross1 = (Double)(sales * salary.pIncentive() + salary.baseSalary());
        //Calculate gross from sales value x 7% + base of $75,000       
        gross2 = (Double)(sales * (salary.pIncentive() * salary.goalMultiplier()) + salary.baseSalary());

        //Determine is salesperson has reached $120,000 sales goal
        if (sales >= salary.salesGoal())
        {
            System.out.println("\nCongratulations! You have surpassed the");
            System.out.println("requirements to receive a sales bonus");
            System.out.println("including exceptional service incentives!\n");
            System.out.printf("Your gross income earned is $%.2f\n",gross2);
            System.out.println();
        }
        //Determine if salesperson has met 80% incentive requirement
        else if (sales >= salary.startIncentive() * salary.salesGoal() && sales < salary.salesGoal())
        {
            System.out.println("\nCongratulations! You have met the");
            System.out.println("requirements to receive your sales bonus!\n");
            System.out.printf("Your gross income earned is $%.2f\n",gross1);
            System.out.println();
        }
        //Results if sales incentive minimum has not been reached
        else
        {
            System.out.println("\nWe are sorry, you have not met the");
            System.out.println("requirements to receive a sales bonus.");
            System.out.println();
        }
        //CReate table header before calculation insertions
        System.out.println("Total Sales  |  Total Compensation");
        System.out.println("----------------------------------");
        
        //Begin table calculations where table loops until reaching 50% above initial sales value
        while (table <= sales * salary.goalMultiplier())    
        {
            System.out.printf(" $%.2f",table); //Print the sales input amount
            if (table >= salary.salesGoal()) //Determine if table variable is greater than $120,000
            {
                //Variable gross2 receives value table(salary) x (.07 x 1.5) + 75000
                gross2 = (Double)(table * (salary.pIncentive() * salary.goalMultiplier()) + salary.baseSalary());    
                System.out.printf(" -->  $%.2f\n",gross2);
                table = table + 5000; //Add $5000 to table value to derive gross2 value
            }
            //Determine if table valuie is greater than 80% of $120000 and less than $120000
            else if (table >= salary.startIncentive() * salary.salesGoal() && table < salary.salesGoal())
            {
                //Variable gross1 receives value table(salary) x .07 + 75000
                gross1 = (Double)(table * salary.pIncentive() + salary.baseSalary());
                System.out.printf(" -->  $%.2f\n",gross1);
                table = table + 5000; //Add $5000 to table value to derive gross1 value 
            }
            //If previous two conditions are false then execute this condition
            else
            {
                //Assign base salary value to gross variable for use in table
                gross = salary.baseSalary();
                System.out.printf(" -->  $%.2f\n",gross);
                table = table + 5000; //Add $5000 to table value to derive gross value 
            }
        }
    }
}
/**Algorithm for SalesProjectv2
 * 
 * Define conditions of annual salary
 *      Base salary starts @ $75,000
 *      Sales target = $120,000
 * Incentive starts at 80% of target
 *      If 120000 * .8 = true
 *      then return value @ .07 * incentive
 * Incentive multiplier value
 *      If >= 120000 = true
 *      then return value (.07 * 1.5) * incentive
 * No bonus
 *      If 120000 * .8 = false
 *      then return value salary un-modified
 * Possible salary table
 *      while print sales earned + 5000
 *      until sales earned = sales earned * 1.5
 * 
 */
