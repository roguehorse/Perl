/*
 * Contacts data class
 * 
 */
package contacts_v1;

/*
 * Contacts 
 * Scott DuBois
 * PRG/421
 * October 28, 2013
 * Roland Morales
 */

import java.io.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.GroupLayout.*;

public class contactdata extends JFrame
{
    
    /**************** User Collection Data ****************/
    
    //Create main panel
    JPanel mainPanel;        //Panel to hold data
    
    //First name collection
    JLabel fname1;           //First name variable
    JTextField fname1a;      //First name text field
    
    //Last name collection
    JLabel lname1;           //Last name variable
    JTextField lname1a;      //Last name text field
    String lname1b;
    
    //Age collection
    JLabel age1;             //Age variable
    JTextField age1a;        //Age text field
    
    //Email collection               
    JLabel mail1;            //E-Mail variable
    JTextField mail1a;       //E-Mail text field
    
    //Cell collection           
    JLabel cell1;            //Cell number variable
    JTextField cell1a;       //Cell text field
       
    //Spacer
    JLabel space;            //Empty spacer
    
    //Text write to file
    String file_name = "data.txt";
    
    /******************* Window Data **********************/
    
    //Window sizes
    private final int WINDOW_W = 360;  //Set window width
    private final int WINDOW_H = 250;  //Set window height
    
    /*****************Collect Data Button ****************/
    
    //Collection action button
    JButton collect1;   
    
    /*****************Read Data Button *******************/
    
    //Read from file action button
    JButton collect2;  
    
    /****************Collected Data Display **************/
    
    //Information display panel
    JPanel dispPanel;    
        
    /*
     * Construct Data
     */
    
    public contactdata()
    {
        
        //Call JFrame constructor and pass title
        super("Contact Information");
        
        //Define action when window is closed
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                
        //Set Window Size
        setSize(WINDOW_W, WINDOW_H);
        setResizable(false);
        
        //Center window
        setLocationRelativeTo(null);
        
        //Build the panel to hold content
        aPanel();
        
        //Display window
        setVisible(true);
        
        //Display panel
        add(mainPanel);
           
    } 
    
    /*
     * Build Panels
     */
    
    private void aPanel()
    {
        
        //Create the panel
        mainPanel = new JPanel();
        
        //First name
        fname1 = new JLabel ("First Name");
        fname1a = new JTextField (10);

        //Last name
        lname1 = new JLabel ("Last Name");
        lname1a = new JTextField ();
        
        //Age
        age1 = new JLabel ("Age");
        age1a = new JTextField ();
  
        //E-Mail
        mail1 = new JLabel ("E-Mail");
        mail1a = new JTextField ();
        
        //Cell number
        cell1 = new JLabel ("Cell Number");
        cell1a = new JTextField ();
        
        //Spacer
        space = new JLabel (" ");
        
        //Write data button
        collect1 = new JButton ("Write Data");
        
        //Read data button
        collect2 = new JButton ("Read Data");
        
        //Set layout manager
        GroupLayout layout = new GroupLayout(mainPanel);
        mainPanel.setLayout(layout);
        layout.setAutoCreateGaps(true);
        layout.setAutoCreateContainerGaps(true);
        
        //Add all items to panel
        
        //Set horizontal
        GroupLayout.SequentialGroup hGroup = layout.createSequentialGroup();
        
        hGroup.addGroup(layout.createParallelGroup()
                .addComponent(fname1)
                .addComponent(lname1)
                .addComponent(age1)
                .addComponent(mail1)
                .addComponent(cell1)
                .addComponent(space)
                .addComponent(collect1));
                

        hGroup.addGroup(layout.createParallelGroup()
                .addComponent(fname1a)
                .addComponent(lname1a)
                .addComponent(age1a)
                .addComponent(mail1a)
                .addComponent(cell1a)      
                .addComponent(collect2));
        

        layout.setHorizontalGroup(hGroup);
        
        //Set vertical 
        GroupLayout.SequentialGroup vGroup = layout.createSequentialGroup();
        
        vGroup.addGroup(layout.createParallelGroup(Alignment.BASELINE)
                .addComponent(fname1).addComponent(fname1a));
        vGroup.addGroup(layout.createParallelGroup(Alignment.BASELINE)
                .addComponent(lname1).addComponent(lname1a));
        vGroup.addGroup(layout.createParallelGroup(Alignment.BASELINE)
                .addComponent(age1).addComponent(age1a));
        vGroup.addGroup(layout.createParallelGroup(Alignment.BASELINE)
                .addComponent(mail1).addComponent(mail1a));
        vGroup.addGroup(layout.createParallelGroup(Alignment.BASELINE)
                .addComponent(cell1).addComponent(cell1a));
        vGroup.addGroup(layout.createParallelGroup(Alignment.CENTER)
                .addComponent(space));
        vGroup.addGroup(layout.createParallelGroup(Alignment.CENTER)
                .addComponent(collect1).addComponent(collect2));
           
        layout.setVerticalGroup(vGroup);
                
        //Write action listener
        collect1.addActionListener(new DataAction());
        
        //Read action listener
        collect2.addActionListener(new DataAction2());
              
    }
    
    public class DataAction implements ActionListener 
    {
        //Create data writing object
        DataWrite dataobj = new DataWrite(file_name, true);
        
        @Override
        public void actionPerformed (ActionEvent e)     
        {
            
            //Collection from inputs
            String fname = (String) fname1a.getText();
            String lname = (String) lname1a.getText();
            String age = (String) age1a.getText();
            String mail = (String) mail1a.getText();
            String cell = (String) cell1a.getText();

            
            //Display the entry results
            JOptionPane.showMessageDialog(null, 
                    "First Name:      " + fname + "\n" + 
                    "Last Name:      " + lname + "\n" +
                    "age:                  " + age + "\n" +
                    "Email:               " + mail + "\n" +
                    "Cell Number:   " + cell + "\n\n" +
                    "Values written to file" + "\n");
            
            //Write data to file using supplied string variables
            try 
            {
                dataobj.dataToFile(fname + " " + lname + " " + age + " " + mail + " " + cell);       
            } 
            
            catch (IOException ex) 
            {
                Logger.getLogger(contactdata.class.getName()).log(Level.SEVERE, null, ex);
            }
        }   
    }
    
    public class DataAction2 implements ActionListener
    {
        public void actionPerformed (ActionEvent e1)
        {
            //File to be read from
            String file_name = "data.txt";
            
            //Action button reads file
            try 
            {
                DataRead dataobj2 = new DataRead(file_name);
                String[] aryLines = dataobj2.OpenFile();
                
                int i;
                for (i=0; i<aryLines.length; i++)
                {
                    System.out.println(aryLines[i]);
                }
            } 
            
            catch (IOException e2) 
            {
               System.out.println(e2.getMessage());
            }
        }

    }
    
    public class DataWrite
    {
        String path;
        boolean append_to_file = false;
        
        //Use this method to write new lines
        public DataWrite(String file_path)
        { 
            path = file_path;   
        }
        
        //Use this method to append new lines
        public DataWrite(String file_path, boolean append_value)
        {
            path = file_path;
            append_to_file = append_value;
        }
        
        public void dataToFile(String textLine) throws IOException
        {
            FileWriter write = new FileWriter(path, append_to_file);
            PrintWriter print_line = new PrintWriter(write);
            
            //Print string values with new line return
            print_line.printf("%s" + "%n", textLine);
            
            //Close print job
            print_line.close();
        }
        
    }
    
    public class DataRead
    {
        public String path2;
        
        public DataRead(String file_path)
        {
            path2 = file_path;
        }
        
        public String[] OpenFile() throws IOException
        {
            FileReader data2 = new FileReader(path2);
            BufferedReader textReader = new BufferedReader(data2);
            
            int dataLines = readLines();
            String[] textData = new String[dataLines];
            
            int i;
            for(i=0; i<dataLines; i++)
            {
                textData[i] = textReader.readLine();
            }
            
            textReader.close();
            return textData;
            
        }
        
        int readLines () throws IOException
        {
            FileReader file_to_read = new FileReader(path2);
            BufferedReader br = new BufferedReader(file_to_read);
            
            String aData;
            int dataLines = 0;
            
            while ((aData = br.readLine()) != null)
            {
                dataLines++;
            }
            br.close();
            return dataLines;
        }
    }
    
}
