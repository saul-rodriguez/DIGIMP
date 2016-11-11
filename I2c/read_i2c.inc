/*
 * This testbench emulates a I2C Master which does the following things:
 * 1) Send I2C Start signal
 * 2) Send Address + R/W#  = 0xAA (Address 0x55 +  R/W 0)
 * 3) Send register pointer byte = 0x02
 * 4) Send I2C Start (Re-Start)
 * 4) Send Address + R/W#  = 0xAB (Address 0x55 +  R/W 1)
 * 5) read data byte sent by slave
 * 6) STOP
 */
    
    #6 SDA = 0; //1) START    
    
    // 2) ADDRESS
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    
    // R/W#
    #10 SCL = 0;#2 SDA = 0; //WRITE
    #10 SCL = 1;
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
    
     // 3) REGISTER ID 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
    
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
     
    #10 SDA = 0; //1) RE-START    
    
    // 2) ADDRESS
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    
    // R/W#
    #10 SCL = 0;#2 SDA = 1; //READ
    #10 SCL = 1;
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
        
    
    //DATA 0 READ
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1;
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1; 
    #10 SCL = 0; 
    #10 SCL = 1; 
    
    #10 SCL = 0;#2 SDA = 1; // NACK (single byte read!)
    #10 SCL = 1; // ACK SAMPLED
    
    /*
     //DATA 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1;
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    
    #10 SCL = 0; 
    #10 SCL = 1;#2 // ACK SAMPLED
    
    */
    
    #10 SCL = 0;#2 SDA = 0;    
    #10 SCL = 1; // STOP
    #4 SDA = 1;
    #10;
       
 
 
