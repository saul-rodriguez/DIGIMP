/*
 * This testbench emulates a I2C Master which does the following things:
 * 1) Send I2C Start signal
 * 2) Send Address + R/W#  = 0xAA (Address 0x55 +  R/W 0)
 * 3) Send register pointer byte = 0x01
 * 4) Send data byte1 = 0x81
 * 5) Send data byte2 = 0x73
 * 6) Stop I2C Signal
 */
    
    #6 SDA = 0; // START    
    
    // ADDRESS
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
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1;
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
    
     //REGISTER ID 
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
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
    
    //DATA 0 0x81
    #10 SCL = 0;#2 SDA = 1;
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
    #10 SCL = 0;#2 SDA = 0;
    #10 SCL = 1; 
    #10 SCL = 0;#2 SDA = 1;
    #10 SCL = 1; 
    
    #10 SCL = 0; 
    #10 SCL = 1; // ACK SAMPLED
    
     //DATA 1 0x73
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
    #10 SCL = 1; // ACK SAMPLED
    
    
    #10 SCL = 0;#2 SDA = 0;    
    #10 SCL = 1; // STOP
    #4 SDA = 1;
    #10;
    
    
 
 
