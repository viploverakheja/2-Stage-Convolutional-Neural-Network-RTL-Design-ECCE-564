//`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW02_mac.v"
module MyDesign (

            //---------------------------------------------------------------------------
            // Control
            //
            output reg                  dut__xxx__finish   ,
            input  wire                 xxx__dut__go       ,  

            //---------------------------------------------------------------------------
            // b-vector memory 
            //
            output reg  [ 9:0]          dut__bvm__address  ,
            output reg                  dut__bvm__enable   ,
            output reg                  dut__bvm__write    ,
            output reg  [15:0]          dut__bvm__data     ,  // write data
            input  wire [15:0]          bvm__dut__data     ,  // read data
            
            //---------------------------------------------------------------------------
            // Input data memory 
            //
            output reg  [ 8:0]          dut__dim__address  ,
            output reg                  dut__dim__enable   ,
            output reg                  dut__dim__write    ,
            output reg  [15:0]          dut__dim__data     ,  // write data
            input  wire [15:0]          dim__dut__data     ,  // read data


            //---------------------------------------------------------------------------
            // Output data memory 
            //
            output reg  [ 2:0]          dut__dom__address  ,
            output reg  [15:0]          dut__dom__data     ,  // write data
            output reg                  dut__dom__enable   ,
            output reg                  dut__dom__write    ,


            //-------------------------------
            // General
            //
            input  wire                 clk             ,
            input  wire                 reset  

            );
			
			
	reg [15:0]  Z000,Z001,Z002,Z003,Z010,Z011,Z012,Z013,Z020,Z021,Z022,Z023,Z030,Z031,Z032,Z033;
	reg [15:0]  Z100,Z101,Z102,Z103,Z110,Z111,Z112,Z113,Z120,Z121,Z122,Z123,Z130,Z131,Z132,Z133;
	reg [15:0]  Z200,Z201,Z202,Z203,Z210,Z211,Z212,Z213,Z220,Z221,Z222,Z223,Z230,Z231,Z232,Z233;
	reg [15:0]  Z300,Z301,Z302,Z303,Z310,Z311,Z312,Z313,Z320,Z321,Z322,Z323,Z330,Z331,Z332,Z333;
	reg [15:0] finalValue0,finalValue1,finalValue2,finalValue3,finalValue4,finalValue5,finalValue6,finalValue7;
			
	reg [15:0] counter;
	reg [10:0] counterB;
	reg [5:0]counterA;
	reg [6:0]counterC;
	reg counterMultiplication;
	reg enablemultiplication;
	reg enablefinalmultiplication;
	reg passtomydesign;	
	reg flag1, flag2, flag3, flag4,flag5;
	reg [15:0] tempaddress, StartAddress;
	//reg [15:0] O1,O2,O3,O4,O5,O6,O7,O8;
	
always@(posedge clk)
begin
	if(reset)
		begin 
			dut__bvm__enable <= 0; 
			dut__dim__enable <= 0;
			dut__bvm__address<=16'h00; 
			enablemultiplication <=0; 
			enablefinalmultiplication<=0;
			counterB <=0;
			passtomydesign <=0;
			dut__xxx__finish <=1;
			dut__dim__data <=0;
			dut__bvm__data <=0;
			counter <=0;
			counterC <=0;
			
		end
	else 
		begin
			if(xxx__dut__go)
				begin 
					dut__dim__address <=16'h00; 
					dut__dim__enable <= 1'b1;
					dut__bvm__address<=16'h00;
					//dut__dom__address<=0;
					dut__dom__enable<=0;
					dut__dom__write<=0;
					dut__dom__data<=finalValue0;
					counterB <=0; 
					counterA <=0;
					dut__xxx__finish <= 0;
					flag1<= 0;
					flag5<=0;
					flag2<=0;
					flag3<=0;	
					flag4<=0;						
					counter <= 0;
					
				end
			else
				begin
						if(counter>=0 && counter <38)
						begin flag1 <= 1'b1 ;flag2 <=0;flag3 <= 0;flag4 <=0;flag5<=0; end
						else if (counter >=38 && counter <178)
						begin flag1 <=0; flag2 <= 0 ; flag3<=0; flag4 <=0;flag5<=0; end
						else if (counter >=178 && counter <215)
						begin flag1 <=0; flag2 <=1'b1; flag3<=0; flag4 <=0; flag5<=0; end
						else if (counter >=215 && counter <370)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=0; flag5<=0; end
						else if (counter >=370 && counter <408)
						begin flag1 <=0; flag2 <=0; flag3 <= 1'b1; flag4 <=0; flag5<=0; end
						else if (counter >=408 && counter <565)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=0;flag5<=0;  end
						else if (counter >=565 && counter <604)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=1; flag5<=0; end
						else if (counter >=604 && counter <758)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=0; flag5<=0; end
						else if(counter>=758 && counter<1270)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=0;flag5<=1'b1;end
						else if(counter>=1270)
						begin flag1 <=0; flag2 <=0; flag3 <= 0; flag4 <=0;flag5<=0; end 
						counter <= counter +1; 
						counterA<= counterA +1;
						
						if (counter == 1218)
						dut__xxx__finish <=1;
	case (counter)
	0: begin 
		tempaddress <= 16'h00;
		dut__dim__address<=16'h00; 
		StartAddress<=16'h00;
		dut__bvm__address<=16'h00; 
		dut__bvm__enable <= 1'b1;
		
	    end
	38: begin
	  	enablemultiplication<=1;
		
	    end
	177: begin 
		counterA<=0;
		dut__dim__address <=16'h06; 
		tempaddress <= 16'h06; 
		StartAddress<= 16'h06;  
		dut__bvm__address<=16'h00;
		dut__dim__enable<=1;
		dut__bvm__enable <=1'b1;
		enablemultiplication<=0; 
		counterB <=0;
		
	    end
	214: begin 
		enablemultiplication<=1;
		
	     end
	369: begin 
		counterA<=0; 
		dut__dim__address <=16'h60; 
		tempaddress <= 16'h60; 
		StartAddress<= 16'h60; 
		dut__bvm__address<=16'h00;
		dut__dim__enable<=1;
		dut__bvm__enable <=1'b1;
		enablemultiplication <=0;
		counterB <=0;
	     end	
	407: begin 
		enablemultiplication <=1;
		
	     end
	564:begin 
		counterA<=0;
		dut__dim__address <=16'h66; 
		tempaddress <= 16'h66; 
		StartAddress<= 16'h66;  
		dut__bvm__address<=16'h00;
		dut__dim__enable<=1;
		dut__bvm__enable <=1'b1;
		enablemultiplication <=0;
		counterB <=0; 
		end	
	603: begin	enablemultiplication<=1; dut__dim__enable<=0; end
	757: begin 
		dut__bvm__enable <=1'b1; 
		dut__bvm__address<=16'h40; 
		enablemultiplication<=0;
		enablefinalmultiplication<=1;
		counterC<=0;end
	1207: begin enablefinalmultiplication<=0;dut__bvm__enable<=0;flag5<=0;	end
	//1208: begin dut__dom__enable<=1; end
	1209:  begin dut__dom__enable<=1;dut__dom__write<=1;dut__dom__data<= finalValue0;dut__dom__address<=0;end
	1217: begin dut__dom__write<=0;dut__dom__enable<=0;  end
	endcase

		if(dut__dim__enable && (flag1 == 1'b1 || flag2 == 1'b1 || flag3 ==1'b1 || flag4 == 1'b1)) 
					begin 
						
						if (dut__dim__address == (tempaddress +16'h02) )
							dut__dim__address <= tempaddress + 16'h10;
						else if (dut__dim__address == (tempaddress + 16'h12))
							dut__dim__address <= tempaddress +16'h20;
						else if (dut__dim__address == (tempaddress + 16'h22))
						begin	
							
							if(tempaddress == (StartAddress + 16'h03))
							begin
							dut__dim__address <= StartAddress + 16'b0000000000110000;
							tempaddress <= StartAddress + 16'b0000000000110000;
							end
							else if(dut__dim__address != 16'h55)	
							begin							
							tempaddress <= tempaddress + 16'h03;
					                dut__dim__address <= tempaddress+ 16'h03;
							end
								
						end
						
						else begin
							dut__dim__address <= dut__dim__address +1;
														
						end
			end
end

	if(dut__bvm__enable && (flag1 == 1'b1 || flag2 == 1'b1 || flag3 ==1'b1 || flag4 == 1'b1) && flag5 != 1'b1)
					begin
					case(dut__bvm__address)
					16'h008 : dut__bvm__address <= dut__bvm__address + 16'h008;				
					16'h018 : dut__bvm__address <= dut__bvm__address + 16'h008;
                                        16'h028 : dut__bvm__address <= dut__bvm__address + 16'h008;
					16'h038 : dut__bvm__address <= dut__bvm__address + 16'h008;
					default :begin dut__bvm__address <= dut__bvm__address + 1; 
							if(dut__bvm__address== 16'h037) dut__bvm__enable<=0;end
					endcase 
					end
	if(dut__bvm__enable && flag1 != 1'b1 && flag2 != 1'b1 && flag3 !=1'b1 && flag4 != 1'b1 && flag5 == 1'b1)
			begin
				dut__bvm__address <= dut__bvm__address + 1;
			end
				
if(enablemultiplication)
		begin
			if(counterB<145)begin
			//if (counterB == 37) passtomydesign<= 1;	
			counterB<= counterB+1;
			end
			else 
			begin counterB <=0;end
		end	

end

if(enablefinalmultiplication)
	begin
		if(counterC<64)
			counterC<=counterC+1;
		else counterC<=1;
	end
if(dut__dom__write)
begin		
			case(counter)
			1210: begin dut__dom__address<=16'h01;dut__dom__data<= finalValue1; end
			1211: begin dut__dom__data<= finalValue2; dut__dom__address<=16'h02; end 
			1212: begin dut__dom__data<= finalValue3; dut__dom__address<=16'h03; end 
			1213: begin dut__dom__data<= finalValue4; dut__dom__address<=16'h04; end 
			1214: begin dut__dom__data<= finalValue5; dut__dom__address<=16'h05; end 
			1215: begin dut__dom__data<= finalValue6; dut__dom__address<=16'h06; end 
			1216: begin dut__dom__data<= finalValue7; dut__dom__address<=16'h07; end
			
			endcase

	end		
		
	
end
	



arraymodule u1 (.clk(clk),.reset(reset), 
//.b_vector_enable(dut__bvm__enable), 
.b_vector_data_input(bvm__dut__data), 
//.input_memory_enable(dut__dim__enable), 
.input_memory_datavale(dim__dut__data), 
.counterforA(counterA),
.counterforB(counterB),
.enablemult(enablemultiplication),
.passtodesign(passtomydesign),
.flag(flag1), 
.counter(counter),
.Z00(Z000), 
.Z01(Z001), 
.Z02(Z002), 
.Z03(Z003), 
.Z10(Z010), 
.Z11(Z011), 
.Z12(Z012), 
.Z13(Z013), 
.Z20(Z020), 
.Z21(Z021), 
.Z22(Z022), 
.Z23(Z023), 
.Z30(Z030), 
.Z31(Z031), 
.Z32(Z032), 
.Z33(Z033));


arraymodule u2 (.clk(clk),.reset(reset), 
//.b_vector_enable(dut__bvm__enable), 
.b_vector_data_input(bvm__dut__data), 
//.input_memory_enable(dut__dim__enable), 
.input_memory_datavale(dim__dut__data), 
.counterforA(counterA),
.counterforB(counterB),
.enablemult(enablemultiplication),
.passtodesign(passtomydesign),
.flag(flag2), 
.counter(counter),
.Z00(Z100), 
.Z01(Z101), 
.Z02(Z102), 
.Z03(Z103), 
.Z10(Z110), 
.Z11(Z111), 
.Z12(Z112), 
.Z13(Z113), 
.Z20(Z120), 
.Z21(Z121), 
.Z22(Z122), 
.Z23(Z123), 
.Z30(Z130), 
.Z31(Z131), 
.Z32(Z132), 
.Z33(Z133));

arraymodule u3 (.clk(clk), .reset(reset),
//.b_vector_enable(dut__bvm__enable), 
.b_vector_data_input(bvm__dut__data), 
//.input_memory_enable(dut__dim__enable), 
.input_memory_datavale(dim__dut__data), 
.counterforA(counterA),
.counterforB(counterB),
.enablemult(enablemultiplication),
.passtodesign(passtomydesign),
.flag(flag3),
.counter(counter), 
.Z00(Z200), 
.Z01(Z201), 
.Z02(Z202), 
.Z03(Z203), 
.Z10(Z210), 
.Z11(Z211), 
.Z12(Z212), 
.Z13(Z213), 
.Z20(Z220), 
.Z21(Z221), 
.Z22(Z222), 
.Z23(Z223), 
.Z30(Z230), 
.Z31(Z231), 
.Z32(Z232), 
.Z33(Z233));

arraymodule u4 (.clk(clk), .reset(reset),
//.b_vector_enable(dut__bvm__enable), 
.b_vector_data_input(bvm__dut__data), 
//.input_memory_enable(dut__dim__enable), 
.input_memory_datavale(dim__dut__data), 
.counterforA(counterA),
.counterforB(counterB),
.enablemult(enablemultiplication),
.passtodesign(passtomydesign),
.flag(flag4), 
.counter(counter),
.Z00(Z300), 
.Z01(Z301), 
.Z02(Z302), 
.Z03(Z303), 
.Z10(Z310), 
.Z11(Z311), 
.Z12(Z312), 
.Z13(Z313), 
.Z20(Z320), 
.Z21(Z321), 
.Z22(Z322), 
.Z23(Z323), 
.Z30(Z330), 
.Z31(Z331), 
.Z32(Z332), 
.Z33(Z333));

finalmultiplication u5 (.clk(clk),.reset(reset),
.m_vector_data(bvm__dut__data),
.Z1(Z000),.Z2(Z010),.Z3(Z100),.Z4(Z110),.Z5(Z020),.Z6(Z030),.Z7(Z120),.Z8(Z130),.Z9(Z200),.Z10(Z210),
.Z11(Z300),.Z12(Z310),.Z13(Z220),.Z14(Z230),.Z15(Z320),.Z16(Z330),.Z17(Z001),.Z18(Z011),.Z19(Z101),.Z20(Z111),
.Z21(Z021),.Z22(Z031),.Z23(Z121),.Z24(Z131),.Z25(Z201),.Z26(Z211),.Z27(Z301),.Z28(Z311),.Z29(Z221),.Z30(Z231),
.Z31(Z321),.Z32(Z331),.Z33(Z002),.Z34(Z012),.Z35(Z102),.Z36(Z112),.Z37(Z022),.Z38(Z032),.Z39(Z122),.Z40(Z132),
.Z41(Z202),.Z42(Z212),.Z43(Z302),.Z44(Z312),.Z45(Z222),.Z46(Z232),.Z47(Z322),.Z48(Z332),.Z49(Z003),.Z50(Z013),
.Z51(Z103),.Z52(Z113),.Z53(Z023),.Z54(Z033),.Z55(Z123),.Z56(Z133),.Z57(Z203),.Z58(Z213),.Z59(Z303),.Z60(Z313),
.Z61(Z223),.Z62(Z233),.Z63(Z323),.Z64(Z333),.flag(flag5),.countervalue(counter),.mulcounter(counterC),.finalValue0(finalValue0),.finalValue1(finalValue1),.finalValue2(finalValue2),.finalValue3(finalValue3),.finalValue4(finalValue4),.finalValue5(finalValue5),.finalValue6(finalValue6),.finalValue7(finalValue7),.enablefinalmultiplication(enablefinalmultiplication)
);

endmodule 			


module arraymodule(
			input  wire                 clk  ,
			input wire reset,
           // b-vector memory 
           // output reg                  b_vector_enable   ,
            input  wire [15:0]          b_vector_data_input     ,  // read data
            
            //---------------------------------------------------------------------------
            // Input data memory 
            //
           // output reg                  input_memory_enable   ,
            input  wire [15:0]          input_memory_datavale     ,  // read data
	     // flag values
		input wire flag,
		input wire [5:0] counterforA,
		input wire [10:0] counterforB,
		input wire [15:0] counter,
		input wire enablemult,
		input wire passtodesign,
		//Z values to mydesign
		   output reg [15:0] Z00 ,
		   output reg [15:0] Z01 ,
		   output reg [15:0] Z02 ,
		   output reg [15:0] Z03 ,
		   output reg [15:0] Z10 ,
		   output reg [15:0] Z11 ,
		   output reg [15:0] Z12 ,
		   output reg [15:0] Z13 ,
		   output reg [15:0] Z20 ,
		   output reg [15:0] Z21 ,
		   output reg [15:0] Z22 ,
		   output reg [15:0] Z23 ,
		   output reg [15:0] Z30 ,
		   output reg [15:0] Z31 ,
		   output reg [15:0] Z32 ,
		   output reg [15:0] Z33 
		   );
	
    //reg [8:0] counter;
	//reg [8:0] counterA;
	//reg [8:0] counterB;
    reg [15:0] vectorA [35:0];
    reg [15:0] vectorB0 [8:0];
    reg [15:0] vectorB1 [8:0];
    reg [15:0] vectorB2 [8:0];
    reg [15:0] vectorB3 [8:0];
  //  reg [7:0]  i,j,m,n;
   // reg [8:0] k;
    reg [16:0] store;
   // reg [15:0] tempaddress; 
    //parameter [15:0] StartAddress =0;
    reg enablemultiplication;
	reg [31:0] inst_c0;
	//reg [31:0] inst_c1;
	//reg [31:0] inst_c2;
	//reg [31:0] inst_c3;
	reg [31:0] C0;
	//reg [31:0] C1;
	//reg [31:0] C2;
	//reg [31:0] C3;
   /* reg [15:0] tempZ00 ;
    reg [15:0] tempZ01 ;
    reg [15:0] tempZ02 ;
    reg [15:0] tempZ03 ;
    reg [15:0] tempZ10 ;
    reg [15:0] tempZ11 ;
    reg [15:0] tempZ12 ;
    reg [15:0] tempZ13 ;
    reg [15:0] tempZ20 ;
    reg [15:0] tempZ21 ;
    reg [15:0] tempZ22 ;
    reg [15:0] tempZ23 ;
    reg [15:0] tempZ30 ;
    reg [15:0] tempZ31 ;
    reg [15:0] tempZ32 ;
    reg [15:0] tempZ33 ;*/
   // reg [15:0] datastore;
    reg [15:0] B0vector;
   /* reg [15:0] B1vector;
    reg [15:0] B2vector;
    reg [15:0] B3vector;*/
    reg [15:0] Avector;	
 			
	

	
always@ (posedge clk)
	begin
		if((flag == 1'b1)) // input_memory_enable && 
		vectorA[counterforA-1]<= input_memory_datavale;
	end		

always@(posedge clk)
	begin
		
	/*if(b_vector_enable)
		begin*/	
	if(flag==1'b1)
	begin
		if(counterforA >=1 && counterforA <10)
		begin vectorB0[counterforA-1] <= b_vector_data_input;end
		else if(counterforA >=10 && counterforA < 19)
			vectorB1[counterforA-10] <= b_vector_data_input;
		else if(counterforA >=19 && counterforA <28)
			vectorB2[counterforA-19] <= b_vector_data_input;	
		else if(counterforA >=28 && counterforA <37)
			vectorB3[counterforA-28] <= b_vector_data_input;	
		
		
	end
		
end

///////Start of Multiplication/////

////updated multiplication 
/*always@(posedge clock)
begin
	if(enablemultiplication)
		begin
			if(counterB<40)begin
			if (counterB == 37) passtomydesign<= 1;			
				counterB<= counterB+1;
			end
			else 
			enablemultiplication <=0;		
		end
end*/	

always@(posedge clk)
begin
if(reset)
begin Avector<=0;B0vector<=0; inst_c0<=0; end
else
begin
	case(counterforB)
		/*1 : begin
			$display("enterfirstloop");
			Avector = vectorA[0];
			B0vector = vectorB0[0];
			B1vector = vectorB1[0];
			B2vector = vectorB2[0];
			B3vector = vectorB3[0];
			inst_c0 = 0;
			inst_c1 = 0;
			inst_c2 = 0;
			inst_c3	= 0;	    
			end				
		2 : begin
			Avector = vectorA[1];
			B0vector = vectorB0[1];
			B1vector = vectorB1[1];
			B2vector = vectorB2[1];
			B3vector = vectorB3[1];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;	    
			end
		3 :begin
			Avector = vectorA[2];
			B0vector = vectorB0[2];
			B1vector = vectorB1[2];
			B2vector = vectorB2[2];
			B3vector = vectorB3[2];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;	    
			end
		4 :begin
			Avector = vectorA[3];
			B0vector = vectorB0[3];
			B1vector = vectorB1[3];
			B2vector = vectorB2[3];
			B3vector = vectorB3[3];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		5 :begin
			Avector = vectorA[4];
			B0vector = vectorB0[4];
			B1vector = vectorB1[4];
			B2vector = vectorB2[4];
			B3vector = vectorB3[4];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		6 :begin
			Avector = vectorA[5];
			B0vector = vectorB0[5];
			B1vector = vectorB1[5];
			B2vector = vectorB2[5];
			B3vector = vectorB3[5];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		7 :begin
			Avector = vectorA[6];
			B0vector = vectorB0[6];
			B1vector = vectorB1[6];
			B2vector = vectorB2[6];
			B3vector = vectorB3[6];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		8 :begin
			Avector = vectorA[7];
			B0vector = vectorB0[7];
			B1vector = vectorB1[7];
			B2vector = vectorB2[7];
			B3vector = vectorB3[7];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		9 :begin
			Avector = vectorA[8];
			B0vector = vectorB0[8];
			B1vector = vectorB1[8];
			B2vector = vectorB2[8];
			B3vector = vectorB3[8];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		10 :begin
			Avector = vectorA[9];
			B0vector = vectorB0[0];
			B1vector = vectorB1[0];
			B2vector = vectorB2[0];
			B3vector = vectorB3[0];
			inst_c0 = 0;
			inst_c1 = 0;
			inst_c2 = 0;
			inst_c3	= 0;	    
			end
		11 :begin
			Avector = vectorA[10];
			B0vector = vectorB0[1];
			B1vector = vectorB1[1];
			B2vector = vectorB2[1];
			B3vector = vectorB3[1];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		12 :begin
			Avector = vectorA[11];
			B0vector = vectorB0[2];
			B1vector = vectorB1[2];
			B2vector = vectorB2[2];
			B3vector = vectorB3[2];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;	
			end
		13 :begin
			Avector = vectorA[12];
			B0vector = vectorB0[3];
			B1vector = vectorB1[3];
			B2vector = vectorB2[3];
			B3vector = vectorB3[3];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		14 :begin
			Avector = vectorA[13];
			B0vector = vectorB0[4];
			B1vector = vectorB1[4];
			B2vector = vectorB2[4];
			B3vector = vectorB3[4];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		15 :begin
			Avector = vectorA[14];
			B0vector = vectorB0[5];
			B1vector = vectorB1[5];
			B2vector = vectorB2[5];
			B3vector = vectorB3[5];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		16 :begin
			Avector = vectorA[15];
			B0vector = vectorB0[6];
			B1vector = vectorB1[6];
			B2vector = vectorB2[6];
			B3vector = vectorB3[6];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		17 :begin
			Avector = vectorA[16];
			B0vector = vectorB0[7];
			B1vector = vectorB1[7];
			B2vector = vectorB2[7];
			B3vector = vectorB3[7];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		18 : begin
			Avector = vectorA[17];
			B0vector = vectorB0[8];
			B1vector = vectorB1[8];
			B2vector = vectorB2[8];
			B3vector = vectorB3[8];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		19 :begin
			Avector = vectorA[18];
			B0vector = vectorB0[0];
			B1vector = vectorB1[0];
			B2vector = vectorB2[0];
			B3vector = vectorB3[0];
			inst_c0 = 0;
			inst_c1 = 0;
			inst_c2 = 0;
			inst_c3	= 0;	    
			end
		20 :begin
			Avector = vectorA[19];
			B0vector = vectorB0[1];
			B1vector = vectorB1[1];
			B2vector = vectorB2[1];
			B3vector = vectorB3[1];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		21 :begin
			Avector = vectorA[20];
			B0vector = vectorB0[2];
			B1vector = vectorB1[2];
			B2vector = vectorB2[2];
			B3vector = vectorB3[2];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		22 :begin
			Avector = vectorA[21];
			B0vector = vectorB0[3];
			B1vector = vectorB1[3];
			B2vector = vectorB2[3];
			B3vector = vectorB3[3];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		23 :begin
			Avector = vectorA[22];
			B0vector = vectorB0[4];
			B1vector = vectorB1[4];
			B2vector = vectorB2[4];
			B3vector = vectorB3[4];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;	
				    
			end
		24 :begin
			Avector = vectorA[23];
			B0vector = vectorB0[5];
			B1vector = vectorB1[5];
			B2vector = vectorB2[5];
			B3vector = vectorB3[5];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		25 :begin
			Avector = vectorA[24];
			B0vector = vectorB0[6];
			B1vector = vectorB1[6];
			B2vector = vectorB2[6];
			B3vector = vectorB3[6];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		26 :begin
			Avector = vectorA[25];
			B0vector = vectorB0[7];
			B1vector = vectorB1[7];
			B2vector = vectorB2[7];
			B3vector = vectorB3[7];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		27 :begin
			Avector = vectorA[26];
			B0vector = vectorB0[8];
			B1vector = vectorB1[8];
			B2vector = vectorB2[8];
			B3vector = vectorB3[8];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		28 :begin
			
			Avector = vectorA[27];
			B0vector = vectorB0[0];
			B1vector = vectorB1[0];
			B2vector = vectorB2[0];
			B3vector = vectorB3[0];
			inst_c0 = 0;
			inst_c1 = 0;
			inst_c2 = 0;
			inst_c3	= 0;	    
			end
		29 :begin
			Avector = vectorA[28];
			B0vector = vectorB0[1];
			B1vector = vectorB1[1];
			B2vector = vectorB2[1];
			B3vector = vectorB3[1];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		30 :begin
			Avector = vectorA[29];
			B0vector = vectorB0[2];
			B1vector = vectorB1[2];
			B2vector = vectorB2[2];
			B3vector = vectorB3[2];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;	
			end
		31 :begin
			Avector = vectorA[30];
			B0vector = vectorB0[3];
			B1vector = vectorB1[3];
			B2vector = vectorB2[3];
			B3vector = vectorB3[3];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		32 :begin
			Avector = vectorA[31];
			B0vector = vectorB0[4];
			B1vector = vectorB1[4];
			B2vector = vectorB2[4];
			B3vector = vectorB3[4];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		33 :begin
			Avector = vectorA[32];
			B0vector = vectorB0[5];
			B1vector = vectorB1[5];
			B2vector = vectorB2[5];
			B3vector = vectorB3[5];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		34 :begin
			Avector = vectorA[33];
			B0vector = vectorB0[6];
			B1vector = vectorB1[6];
			B2vector = vectorB2[6];
			B3vector = vectorB3[6];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		35 :begin
			Avector = vectorA[34];
			B0vector = vectorB0[7];
			B1vector = vectorB1[7];
			B2vector = vectorB2[7];
			B3vector = vectorB3[7];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		36 :begin
			Avector = vectorA[35];
			B0vector = vectorB0[8];
			B1vector = vectorB1[8];
			B2vector = vectorB2[8];
			B3vector = vectorB3[8];
			inst_c0 = C0;
			inst_c1 = C1;
			inst_c2 = C2;
			inst_c3	= C3;		    
			end
		default : begin inst_c0 = 0;inst_c1=0;inst_c2=0;inst_c3=0;Avector=0;B0vector=0;B1vector=0;B2vector=0;B3vector=0; end*/
		/*1 : begin
			$display("enterfirstloop");
			Avector = vectorA[0];
			B0vector = vectorB0[0];
			inst_c0 = 0;
			end				
		2 : begin
			Avector = vectorA[1];
			B0vector = vectorB0[1];
			inst_c0 = C0;
			end
		3 :begin
			Avector = vectorA[2];
			B0vector = vectorB0[2];
			inst_c0 = C0;
			end
		4 :begin
			Avector = vectorA[3];
			B0vector = vectorB0[3];
			inst_c0 = C0;
			end
		5 :begin
			Avector = vectorA[4];
			B0vector = vectorB0[4];
			inst_c0 = C0;
			end
		6 :begin
			Avector = vectorA[5];
			B0vector = vectorB0[5];
			inst_c0 = C0;
			end
		7 :begin
			Avector = vectorA[6];
			B0vector = vectorB0[6];
			inst_c0 = C0;
			end
		8 :begin
			Avector = vectorA[7];
			B0vector = vectorB0[7];
			inst_c0 = C0;
			end
		9 :begin
			Avector = vectorA[8];
			B0vector = vectorB0[8];
			inst_c0 = C0;
			end
		10 :begin
			Avector = vectorA[9];
			B0vector = vectorB0[0];
			inst_c0 = 0;
			end
		11 :begin
			Avector = vectorA[10];
			B0vector = vectorB0[1];
			inst_c0 = C0;
			end
		12 :begin
			Avector = vectorA[11];
			B0vector = vectorB0[2];
			inst_c0 = C0;
			end
		13 :begin
			Avector = vectorA[12];
			B0vector = vectorB0[3];
			inst_c0 = C0;
			end
		14 :begin
			Avector = vectorA[13];
			B0vector = vectorB0[4];
			inst_c0 = C0;
			end
		15 :begin
			Avector = vectorA[14];
			B0vector = vectorB0[5];
			inst_c0 = C0;
			end
		16 :begin
			Avector = vectorA[15];
			B0vector = vectorB0[6];
			inst_c0 = C0;
			end
		17 :begin
			Avector = vectorA[16];
			B0vector = vectorB0[7];
			inst_c0 = C0;
			end
		18 : begin
			Avector = vectorA[17];
			B0vector = vectorB0[8];
			inst_c0 = C0;
			end
		19 :begin
			Avector = vectorA[18];
			B0vector = vectorB0[0];
			inst_c0 = 0;
			end
		20 :begin
			Avector = vectorA[19];
			B0vector = vectorB0[1];
			inst_c0 = C0;
			end
		21 :begin
			Avector = vectorA[20];
			B0vector = vectorB0[2];
			inst_c0 = C0;
			end
		22 :begin
			Avector = vectorA[21];
			B0vector = vectorB0[3];
			inst_c0 = C0;
			end
		23 :begin
			Avector = vectorA[22];
			B0vector = vectorB0[4];
			inst_c0 = C0;
			end
		24 :begin
			Avector = vectorA[23];
			B0vector = vectorB0[5];
			inst_c0 = C0;
			end
		25 :begin
			Avector = vectorA[24];
			B0vector = vectorB0[6];
			inst_c0 = C0;
			end
		26 :begin
			Avector = vectorA[25];
			B0vector = vectorB0[7];
			inst_c0 = C0;
			end
		27 :begin
			Avector = vectorA[26];
			B0vector = vectorB0[8];
			inst_c0 = C0;
			end
		28 :begin
			
			Avector = vectorA[27];
			B0vector = vectorB0[0];
			inst_c0 = 0;
			end
		29 :begin
			Avector = vectorA[28];
			B0vector = vectorB0[1];
			inst_c0 = C0;
			end
		30 :begin
			Avector = vectorA[29];
			B0vector = vectorB0[2];
			inst_c0 = C0;
			end
		31 :begin
			Avector = vectorA[30];
			B0vector = vectorB0[3];
			inst_c0 = C0;
			end
		32 :begin
			Avector = vectorA[31];
			B0vector = vectorB0[4];
			inst_c0 = C0;
			end
		33 :begin
			Avector = vectorA[32];
			B0vector = vectorB0[5];
			inst_c0 = C0;
			end
		34 :begin
			Avector = vectorA[33];
			B0vector = vectorB0[6];
			inst_c0 = C0;
			end
		35 :begin
			Avector = vectorA[34];
			B0vector = vectorB0[7];
			inst_c0 = C0;
			end
		36 :begin
			Avector = vectorA[35];
			B0vector = vectorB0[8];
			inst_c0 = C0;
			end
		37: begin 
		    			Avector = vectorA[0];
					B0vector = vectorB1[0];
					inst_c0 = 0;
			end
		38 :begin
					Avector = vectorA[1];
					B0vector = vectorB1[1];
					inst_c0 = C0;
					end
		39 :begin
					Avector = vectorA[2];
					B0vector = vectorB1[2];
					inst_c0 = C0;
					end
		40 :begin
					Avector = vectorA[3];
					B0vector = vectorB1[3];
					inst_c0 = C0;
					end
		41 :begin
					Avector = vectorA[4];
					B0vector = vectorB1[4];
					inst_c0 = C0;
					end
		42 :begin
					Avector = vectorA[5];
					B0vector = vectorB1[5];
					inst_c0 = C0;
					end
		43 :begin
					Avector = vectorA[6];
					B0vector = vectorB1[6];
					inst_c0 = C0;
					end
		44 :begin
					Avector = vectorA[7];
					B0vector = vectorB1[7];
					inst_c0 = C0;
					end
		45 :begin
					Avector = vectorA[8];
					B0vector = vectorB1[8];
					inst_c0 = C0;
					end
		46 :begin
					Avector = vectorA[9];
					B0vector = vectorB1[0];
					inst_c0 = 0;
					end
		47 :begin
					Avector = vectorA[10];
					B0vector = vectorB1[1];
					inst_c0 = C0;
					end
		48 :begin
					Avector = vectorA[11];
					B0vector = vectorB1[2];
					inst_c0 = C0;
					end
		49 :begin
					Avector = vectorA[12];
					B0vector = vectorB1[3];
					inst_c0 = C0;
					end
		50 :begin
					Avector = vectorA[13];
					B0vector = vectorB1[4];
					inst_c0 = C0;
					end
		51 :begin
					Avector = vectorA[14];
					B0vector = vectorB1[5];
					inst_c0 = C0;
					end
		52 :begin
					Avector = vectorA[15];
					B0vector = vectorB1[6];
					inst_c0 = C0;
					end
		53 :begin
					Avector = vectorA[16];
					B0vector = vectorB1[7];
					inst_c0 = C0;
					end
		54 :begin
					Avector = vectorA[17];
					B0vector = vectorB1[8];
					inst_c0 = C0;
					end
		55 :begin
					Avector = vectorA[18];
					B0vector = vectorB1[0];
					inst_c0 = 0;
					end
		56 :begin
					Avector = vectorA[19];
					B0vector = vectorB1[1];
					inst_c0 = C0;
					end
		57 :begin
					Avector = vectorA[20];
					B0vector = vectorB1[2];
					inst_c0 = C0;
					end
		58 :begin
					Avector = vectorA[21];
					B0vector = vectorB1[3];
					inst_c0 = C0;
					end
		59 :begin
					Avector = vectorA[22];
					B0vector = vectorB1[4];
					inst_c0 = C0;
					end
		60 :begin
					Avector = vectorA[23];
					B0vector = vectorB1[5];
					inst_c0 = C0;
					end
		61 :begin
					Avector = vectorA[24];
					B0vector = vectorB1[6];
					inst_c0 = C0;
					end
		62 :begin
					Avector = vectorA[25];
					B0vector = vectorB1[7];
					inst_c0 = C0;
					end
		63 :begin
					Avector = vectorA[26];
					B0vector = vectorB1[8];
					inst_c0 = C0;
					end
		64 :begin
					Avector = vectorA[27];
					B0vector = vectorB1[0];
					inst_c0 = 0;
					end
		65 :begin
					Avector = vectorA[28];
					B0vector = vectorB1[1];
					inst_c0 = C0;
					end
		66 :begin
					Avector = vectorA[29];
					B0vector = vectorB1[2];
					inst_c0 = C0;
					end
		67 :begin
					Avector = vectorA[30];
					B0vector = vectorB1[3];
					inst_c0 = C0;
					end
		68 :begin
					Avector = vectorA[31];
					B0vector = vectorB1[4];
					inst_c0 = C0;
					end
		69 :begin
					Avector = vectorA[32];
					B0vector = vectorB1[5];
					inst_c0 = C0;
					end
		70 :begin
					Avector = vectorA[33];
					B0vector = vectorB1[6];
					inst_c0 = C0;
					end
		71 :begin
					Avector = vectorA[34];
					B0vector = vectorB1[7];
					inst_c0 = C0;
					end
		72 :begin
					Avector = vectorA[35];
					B0vector = vectorB1[8];
					inst_c0 = C0;
					end
		73 :begin
					Avector = vectorA[0];
					B0vector = vectorB2[0];
					inst_c0 = 0;
					end
		74 :begin
					Avector = vectorA[1];
					B0vector = vectorB2[1];
					inst_c0 = C0;
					end
		75 :begin
					Avector = vectorA[2];
					B0vector = vectorB2[2];
					inst_c0 = C0;
					end
		76 :begin
					Avector = vectorA[3];
					B0vector = vectorB2[3];
					inst_c0 = C0;
					end
		77 :begin
					Avector = vectorA[4];
					B0vector = vectorB2[4];
					inst_c0 = C0;
					end
		78 :begin
					Avector = vectorA[5];
					B0vector = vectorB2[5];
					inst_c0 = C0;
					end
		79 :begin
					Avector = vectorA[6];
					B0vector = vectorB2[6];
					inst_c0 = C0;
					end
		80 :begin
					Avector = vectorA[7];
					B0vector = vectorB2[7];
					inst_c0 = C0;
					end
		81 :begin
					Avector = vectorA[8];
					B0vector = vectorB2[8];
					inst_c0 = C0;
					end
		82 :begin
					Avector = vectorA[9];
					B0vector = vectorB2[0];
					inst_c0 = 0;
					end
		83 :begin
					Avector = vectorA[10];
					B0vector = vectorB2[1];
					inst_c0 = C0;
					end
		84 :begin
					Avector = vectorA[11];
					B0vector = vectorB2[2];
					inst_c0 = C0;
					end
		85 :begin
					Avector = vectorA[12];
					B0vector = vectorB2[3];
					inst_c0 = C0;
					end
		86 :begin
					Avector = vectorA[13];
					B0vector = vectorB2[4];
					inst_c0 = C0;
					end
		87 :begin
					Avector = vectorA[14];
					B0vector = vectorB2[5];
					inst_c0 = C0;
					end
		88 :begin
					Avector = vectorA[15];
					B0vector = vectorB2[6];
					inst_c0 = C0;
					end
		89 :begin
					Avector = vectorA[16];
					B0vector = vectorB2[7];
					inst_c0 = C0;
					end
		90 :begin
					Avector = vectorA[17];
					B0vector = vectorB2[8];
					inst_c0 = C0;
					end
		91 :begin
					Avector = vectorA[18];
					B0vector = vectorB2[0];
					inst_c0 = 0;
					end
		92 :begin
					Avector = vectorA[19];
					B0vector = vectorB2[1];
					inst_c0 = C0;
					end
		93 :begin
					Avector = vectorA[20];
					B0vector = vectorB2[2];
					inst_c0 = C0;
					end
		94 :begin
					Avector = vectorA[21];
					B0vector = vectorB2[3];
					inst_c0 = C0;
					end
		95 :begin
					Avector = vectorA[22];
					B0vector = vectorB2[4];
					inst_c0 = C0;
					end
		96 :begin
					Avector = vectorA[23];
					B0vector = vectorB2[5];
					inst_c0 = C0;
					end
		97 :begin
					Avector = vectorA[24];
					B0vector = vectorB2[6];
					inst_c0 = C0;
					end
		98 :begin
					Avector = vectorA[25];
					B0vector = vectorB2[7];
					inst_c0 = C0;
					end
		99 :begin
					Avector = vectorA[26];
					B0vector = vectorB2[8];
					inst_c0 = C0;
					end
		100 :begin
					Avector = vectorA[27];
					B0vector = vectorB2[0];
					inst_c0 = 0;
					end
		101 :begin
					Avector = vectorA[28];
					B0vector = vectorB2[1];
					inst_c0 = C0;
					end
		102 :begin
					Avector = vectorA[29];
					B0vector = vectorB2[2];
					inst_c0 = C0;
					end
		103 :begin
					Avector = vectorA[30];
					B0vector = vectorB2[3];
					inst_c0 = C0;
					end
		104 :begin
					Avector = vectorA[31];
					B0vector = vectorB2[4];
					inst_c0 = C0;
					end
		105 :begin
					Avector = vectorA[32];
					B0vector = vectorB2[5];
					inst_c0 = C0;
					end
		106 :begin
					Avector = vectorA[33];
					B0vector = vectorB2[6];
					inst_c0 = C0;
					end
		107 :begin
					Avector = vectorA[34];
					B0vector = vectorB2[7];
					inst_c0 = C0;
					end
		108 :begin
					Avector = vectorA[35];
					B0vector = vectorB2[8];
					inst_c0 = C0;
					end
		109 :begin
					Avector = vectorA[0];
					B0vector = vectorB3[0];
					inst_c0 = 0;
					end
		110 :begin
					Avector = vectorA[1];
					B0vector = vectorB3[1];
					inst_c0 = C0;
					end
		111 :begin
					Avector = vectorA[2];
					B0vector = vectorB3[2];
					inst_c0 = C0;
					end
		112 :begin
					Avector = vectorA[3];
					B0vector = vectorB3[3];
					inst_c0 = C0;
					end
		113 :begin
					Avector = vectorA[4];
					B0vector = vectorB3[4];
					inst_c0 = C0;
					end
		114 :begin
					Avector = vectorA[5];
					B0vector = vectorB3[5];
					inst_c0 = C0;
					end
		115 :begin
					Avector = vectorA[6];
					B0vector = vectorB3[6];
					inst_c0 = C0;
					end
		116 :begin
					Avector = vectorA[7];
					B0vector = vectorB3[7];
					inst_c0 = C0;
					end
		117 :begin
					Avector = vectorA[8];
					B0vector = vectorB3[8];
					inst_c0 = C0;
					end
		118 :begin
					Avector = vectorA[9];
					B0vector = vectorB3[0];
					inst_c0 = 0;
					end
		119 :begin
					Avector = vectorA[10];
					B0vector = vectorB3[1];
					inst_c0 = C0;
					end
		120 :begin
					Avector = vectorA[11];
					B0vector = vectorB3[2];
					inst_c0 = C0;
					end
		121 :begin
					Avector = vectorA[12];
					B0vector = vectorB3[3];
					inst_c0 = C0;
					end
		122 :begin
					Avector = vectorA[13];
					B0vector = vectorB3[4];
					inst_c0 = C0;
					end
		123 :begin
					Avector = vectorA[14];
					B0vector = vectorB3[5];
					inst_c0 = C0;
					end
		124 :begin
					Avector = vectorA[15];
					B0vector = vectorB3[6];
					inst_c0 = C0;
					end
		125 :begin
					Avector = vectorA[16];
					B0vector = vectorB3[7];
					inst_c0 = C0;
					end
		126 :begin
					Avector = vectorA[17];
					B0vector = vectorB3[8];
					inst_c0 = C0;
					end
		127 :begin
					Avector = vectorA[18];
					B0vector = vectorB3[0];
					inst_c0 = 0;
					end
		128 :begin
					Avector = vectorA[19];
					B0vector = vectorB3[1];
					inst_c0 = C0;
					end
		129 :begin
					Avector = vectorA[20];
					B0vector = vectorB3[2];
					inst_c0 = C0;
					end
		130 :begin
					Avector = vectorA[21];
					B0vector = vectorB3[3];
					inst_c0 = C0;
					end
		131 :begin
					Avector = vectorA[22];
					B0vector = vectorB3[4];
					inst_c0 = C0;
					end
		132 :begin
					Avector = vectorA[23];
					B0vector = vectorB3[5];
					inst_c0 = C0;
					end
		133 :begin
					Avector = vectorA[24];
					B0vector = vectorB3[6];
					inst_c0 = C0;
					end
		134 :begin
					Avector = vectorA[25];
					B0vector = vectorB3[7];
					inst_c0 = C0;
					end
		135 :begin
					Avector = vectorA[26];
					B0vector = vectorB3[8];
					inst_c0 = C0;
					end
		136 :begin
					Avector = vectorA[27];
					B0vector = vectorB3[0];
					inst_c0 = 0;
					end
		137 :begin
					Avector = vectorA[28];
					B0vector = vectorB3[1];
					inst_c0 = C0;
					end
		138 :begin
					Avector = vectorA[29];
					B0vector = vectorB3[2];
					inst_c0 = C0;
					end
		139 :begin
					Avector = vectorA[30];
					B0vector = vectorB3[3];
					inst_c0 = C0;
					end
		140 :begin
					Avector = vectorA[31];
					B0vector = vectorB3[4];
					inst_c0 = C0;
					end
		141 :begin
					Avector = vectorA[32];
					B0vector = vectorB3[5];
					inst_c0 = C0;
					end
		142 :begin
					Avector = vectorA[33];
					B0vector = vectorB3[6];
					inst_c0 = C0;
					end
		143 :begin
					Avector = vectorA[34];
					B0vector = vectorB3[7];
					inst_c0 = C0;
					end
		144 :begin
					Avector = vectorA[35];
					B0vector = vectorB3[8];
					inst_c0 = C0;
					end*/
		0 : begin
			//$display("enterfirstloop");
			Avector <= vectorA[0];
			B0vector <= vectorB0[0];
			inst_c0 <= 0;
			end				
		1 : begin
			Avector <= vectorA[1];
			B0vector <= vectorB0[1];
			inst_c0 <= C0;
			end
		2 :begin
			Avector <= vectorA[2];
			B0vector <= vectorB0[2];
			inst_c0 <= C0;
			end
		3 :begin
			Avector <= vectorA[3];
			B0vector <= vectorB0[3];
			inst_c0 <= C0;
			end
		4 :begin
			Avector <= vectorA[4];
			B0vector <= vectorB0[4];
			inst_c0 <= C0;
			end
		5 :begin
			Avector <= vectorA[5];
			B0vector <= vectorB0[5];
			inst_c0 <= C0;
			end
		6 :begin
			Avector <= vectorA[6];
			B0vector <= vectorB0[6];
			inst_c0 <= C0;
			end
		7:begin
			Avector <= vectorA[7];
			B0vector <= vectorB0[7];
			inst_c0 <= C0;
			end
		8 :begin
			Avector <= vectorA[8];
			B0vector <= vectorB0[8];
			inst_c0 <= C0;
			end
		9 :begin
			Avector <= vectorA[9];
			B0vector <= vectorB0[0];
			inst_c0 <= 0;
			end
		10 :begin
			Avector <= vectorA[10];
			B0vector <= vectorB0[1];
			inst_c0 <= C0;
			end
		11 :begin
			Avector <= vectorA[11];
			B0vector <= vectorB0[2];
			inst_c0 <= C0;
			end
		12 :begin
			Avector <= vectorA[12];
			B0vector <= vectorB0[3];
			inst_c0 <= C0;
			end
		13 :begin
			Avector <= vectorA[13];
			B0vector <= vectorB0[4];
			inst_c0 <= C0;
			end
		14 :begin
			Avector <= vectorA[14];
			B0vector <= vectorB0[5];
			inst_c0 <= C0;
			end
		15 :begin
			Avector <= vectorA[15];
			B0vector <= vectorB0[6];
			inst_c0 <= C0;
			end
		16 :begin
			Avector <= vectorA[16];
			B0vector <= vectorB0[7];
			inst_c0 <= C0;
			end
		17 : begin
			Avector <= vectorA[17];
			B0vector <= vectorB0[8];
			inst_c0 <= C0;
			end
		18 :begin
			Avector <= vectorA[18];
			B0vector <= vectorB0[0];
			inst_c0 <= 0;
			end
		19 :begin
			Avector <= vectorA[19];
			B0vector <= vectorB0[1];
			inst_c0 <= C0;
			end
		20 :begin
			Avector <= vectorA[20];
			B0vector <= vectorB0[2];
			inst_c0 <= C0;
			end
		21 :begin
			Avector <= vectorA[21];
			B0vector <= vectorB0[3];
			inst_c0 <= C0;
			end
		22 :begin
			Avector <= vectorA[22];
			B0vector <= vectorB0[4];
			inst_c0 <= C0;
			end
		23 :begin
			Avector <= vectorA[23];
			B0vector <= vectorB0[5];
			inst_c0 <= C0;
			end
		24 :begin
			Avector <= vectorA[24];
			B0vector <= vectorB0[6];
			inst_c0 <= C0;
			end
		25 :begin
			Avector <= vectorA[25];
			B0vector <= vectorB0[7];
			inst_c0 <= C0;
			end
		26 :begin
			Avector <= vectorA[26];
			B0vector <= vectorB0[8];
			inst_c0 <= C0;
			end
		27 :begin
			
			Avector <= vectorA[27];
			B0vector <= vectorB0[0];
			inst_c0 <= 0;
			end
		28 :begin
			Avector <= vectorA[28];
			B0vector <= vectorB0[1];
			inst_c0 <= C0;
			end
		29 :begin
			Avector <= vectorA[29];
			B0vector <= vectorB0[2];
			inst_c0 <= C0;
			end
		30 :begin
			Avector <= vectorA[30];
			B0vector <= vectorB0[3];
			inst_c0 <= C0;
			end
		31 :begin
			Avector <= vectorA[31];
			B0vector <= vectorB0[4];
			inst_c0 <= C0;
			end
		32 :begin
			Avector <= vectorA[32];
			B0vector <= vectorB0[5];
			inst_c0 <= C0;
			end
		33 :begin
			Avector <= vectorA[33];
			B0vector <= vectorB0[6];
			inst_c0 <= C0;
			end
		34 :begin
			Avector <= vectorA[34];
			B0vector <= vectorB0[7];
			inst_c0 <= C0;
			end
		35 :begin
			Avector <= vectorA[35];
			B0vector <= vectorB0[8];
			inst_c0 <= C0;
			end
		36: begin 
		    			Avector <= vectorA[0];
					B0vector <= vectorB1[0];
					inst_c0 <= 0;
			end
		37 :begin
					Avector <= vectorA[1];
					B0vector <= vectorB1[1];
					inst_c0 <= C0;
					end
		38 :begin
					Avector <= vectorA[2];
					B0vector <= vectorB1[2];
					inst_c0 <= C0;
					end
		39 :begin
					Avector <= vectorA[3];
					B0vector <= vectorB1[3];
					inst_c0 <= C0;
					end
		40 :begin
					Avector <= vectorA[4];
					B0vector <= vectorB1[4];
					inst_c0 <= C0;
					end
		41 :begin
					Avector <= vectorA[5];
					B0vector <= vectorB1[5];
					inst_c0 <= C0;
					end
		42 :begin
					Avector <= vectorA[6];
					B0vector <= vectorB1[6];
					inst_c0 <= C0;
					end
		43 :begin
					Avector <= vectorA[7];
					B0vector <= vectorB1[7];
					inst_c0 <= C0;
					end
		44 :begin
					Avector <= vectorA[8];
					B0vector <= vectorB1[8];
					inst_c0 <= C0;
					end
		45 :begin
					Avector <= vectorA[9];
					B0vector <= vectorB1[0];
					inst_c0 <= 0;
					end
		46 :begin
					Avector <= vectorA[10];
					B0vector <= vectorB1[1];
					inst_c0 <= C0;
					end
		47 :begin
					Avector <= vectorA[11];
					B0vector <= vectorB1[2];
					inst_c0 <= C0;
					end
		48 :begin
					Avector <= vectorA[12];
					B0vector <= vectorB1[3];
					inst_c0 <= C0;
					end
		49 :begin
					Avector <= vectorA[13];
					B0vector <= vectorB1[4];
					inst_c0 <= C0;
					end
		50 :begin
					Avector <= vectorA[14];
					B0vector <= vectorB1[5];
					inst_c0 <= C0;
					end
		51 :begin
					Avector <= vectorA[15];
					B0vector <= vectorB1[6];
					inst_c0 <= C0;
					end
		52 :begin
					Avector <= vectorA[16];
					B0vector <= vectorB1[7];
					inst_c0 <= C0;
					end
		53 :begin
					Avector <= vectorA[17];
					B0vector <= vectorB1[8];
					inst_c0 <= C0;
					end
		54 :begin
					Avector <= vectorA[18];
					B0vector <= vectorB1[0];
					inst_c0 <= 0;
					end
		55 :begin
					Avector <= vectorA[19];
					B0vector <= vectorB1[1];
					inst_c0 <= C0;
					end
		56 :begin
					Avector <= vectorA[20];
					B0vector <= vectorB1[2];
					inst_c0 <= C0;
					end
		57 :begin
					Avector <= vectorA[21];
					B0vector <= vectorB1[3];
					inst_c0 <= C0;
					end
		58 :begin
					Avector <= vectorA[22];
					B0vector <= vectorB1[4];
					inst_c0 <= C0;
					end
		59 :begin
					Avector <= vectorA[23];
					B0vector <= vectorB1[5];
					inst_c0 <= C0;
					end
		60 :begin
					Avector <= vectorA[24];
					B0vector <= vectorB1[6];
					inst_c0 <= C0;
					end
		61 :begin
					Avector <= vectorA[25];
					B0vector <= vectorB1[7];
					inst_c0 <= C0;
					end
		62 :begin
					Avector <= vectorA[26];
					B0vector <= vectorB1[8];
					inst_c0 <= C0;
					end
		63 :begin
					Avector <= vectorA[27];
					B0vector <= vectorB1[0];
					inst_c0 <= 0;
					end
		64 :begin
					Avector <= vectorA[28];
					B0vector <= vectorB1[1];
					inst_c0 <= C0;
					end
		65 :begin
					Avector <= vectorA[29];
					B0vector <= vectorB1[2];
					inst_c0 <= C0;
					end
		66 :begin
					Avector <= vectorA[30];
					B0vector <= vectorB1[3];
					inst_c0 <= C0;
					end
		67 :begin
					Avector <= vectorA[31];
					B0vector <= vectorB1[4];
					inst_c0 <= C0;
					end
		68 :begin
					Avector <= vectorA[32];
					B0vector <= vectorB1[5];
					inst_c0 <= C0;
					end
		69 :begin
					Avector <= vectorA[33];
					B0vector <= vectorB1[6];
					inst_c0 <= C0;
					end
		70 :begin
					Avector <= vectorA[34];
					B0vector <= vectorB1[7];
					inst_c0 <= C0;
					end
		71 :begin
					Avector <= vectorA[35];
					B0vector <= vectorB1[8];
					inst_c0 <= C0;
					end
		72 :begin
					Avector <= vectorA[0];
					B0vector <= vectorB2[0];
					inst_c0 <= 0;
					end
		73 :begin
					Avector <= vectorA[1];
					B0vector <= vectorB2[1];
					inst_c0 <= C0;
					end
		74 :begin
					Avector <= vectorA[2];
					B0vector <= vectorB2[2];
					inst_c0 <= C0;
					end
		75 :begin
					Avector <= vectorA[3];
					B0vector <= vectorB2[3];
					inst_c0 <= C0;
					end
		76 :begin
					Avector <= vectorA[4];
					B0vector <= vectorB2[4];
					inst_c0 <= C0;
					end
		77 :begin
					Avector <= vectorA[5];
					B0vector <= vectorB2[5];
					inst_c0 <= C0;
					end
		78 :begin
					Avector <= vectorA[6];
					B0vector <= vectorB2[6];
					inst_c0 <= C0;
					end
		79 :begin
					Avector <= vectorA[7];
					B0vector <= vectorB2[7];
					inst_c0 <= C0;
					end
		80 :begin
					Avector <= vectorA[8];
					B0vector <= vectorB2[8];
					inst_c0 <= C0;
					end
		81 :begin
					Avector <= vectorA[9];
					B0vector <= vectorB2[0];
					inst_c0 <= 0;
					end
		82 :begin
					Avector <= vectorA[10];
					B0vector <= vectorB2[1];
					inst_c0 <= C0;
					end
		83 :begin
					Avector <= vectorA[11];
					B0vector <= vectorB2[2];
					inst_c0 <= C0;
					end
		84 :begin
					Avector <= vectorA[12];
					B0vector <= vectorB2[3];
					inst_c0 <= C0;
					end
		85 :begin
					Avector <= vectorA[13];
					B0vector <= vectorB2[4];
					inst_c0 <= C0;
					end
		86 :begin
					Avector <= vectorA[14];
					B0vector <= vectorB2[5];
					inst_c0 <= C0;
					end
		87 :begin
					Avector <= vectorA[15];
					B0vector <= vectorB2[6];
					inst_c0 <= C0;
					end
		88 :begin
					Avector <= vectorA[16];
					B0vector <= vectorB2[7];
					inst_c0 <= C0;
					end
		89 :begin
					Avector <= vectorA[17];
					B0vector <= vectorB2[8];
					inst_c0 <= C0;
					end
		90 :begin
					Avector <= vectorA[18];
					B0vector <= vectorB2[0];
					inst_c0 <= 0;
					end
		91 :begin
					Avector <= vectorA[19];
					B0vector <= vectorB2[1];
					inst_c0 <= C0;
					end
		92 :begin
					Avector <= vectorA[20];
					B0vector <= vectorB2[2];
					inst_c0 <= C0;
					end
		93 :begin
					Avector <= vectorA[21];
					B0vector <= vectorB2[3];
					inst_c0 <= C0;
					end
		94 :begin
					Avector <= vectorA[22];
					B0vector <= vectorB2[4];
					inst_c0 <= C0;
					end
		95 :begin
					Avector <= vectorA[23];
					B0vector <= vectorB2[5];
					inst_c0 <= C0;
					end
		96 :begin
					Avector <= vectorA[24];
					B0vector <= vectorB2[6];
					inst_c0 <= C0;
					end
		97 :begin
					Avector <= vectorA[25];
					B0vector <= vectorB2[7];
					inst_c0 <= C0;
					end
		98 :begin
					Avector <= vectorA[26];
					B0vector <= vectorB2[8];
					inst_c0 <= C0;
					end
		99 :begin
					Avector <= vectorA[27];
					B0vector <= vectorB2[0];
					inst_c0 <= 0;
					end
		100 :begin
					Avector <= vectorA[28];
					B0vector <= vectorB2[1];
					inst_c0 <= C0;
					end
		101 :begin
					Avector <= vectorA[29];
					B0vector <= vectorB2[2];
					inst_c0 <= C0;
					end
		102 :begin
					Avector <= vectorA[30];
					B0vector <= vectorB2[3];
					inst_c0 <= C0;
					end
		103 :begin
					Avector <= vectorA[31];
					B0vector <= vectorB2[4];
					inst_c0 <= C0;
					end
		104 :begin
					Avector <= vectorA[32];
					B0vector <= vectorB2[5];
					inst_c0 <= C0;
					end
		105 :begin
					Avector <= vectorA[33];
					B0vector <= vectorB2[6];
					inst_c0 <= C0;
					end
		106 :begin
					Avector <= vectorA[34];
					B0vector <= vectorB2[7];
					inst_c0 <= C0;
					end
		107 :begin
					Avector <= vectorA[35];
					B0vector <= vectorB2[8];
					inst_c0 <= C0;
					end
		108 :begin
					Avector <= vectorA[0];
					B0vector <= vectorB3[0];
					inst_c0 <= 0;
					end
		109 :begin
					Avector <= vectorA[1];
					B0vector <= vectorB3[1];
					inst_c0 <= C0;
					end
		110 :begin
					Avector <= vectorA[2];
					B0vector <= vectorB3[2];
					inst_c0 <= C0;
					end
		111 :begin
					Avector <= vectorA[3];
					B0vector <= vectorB3[3];
					inst_c0 <= C0;
					end
		112 :begin
					Avector <= vectorA[4];
					B0vector <= vectorB3[4];
					inst_c0 <= C0;
					end
		113 :begin
					Avector <= vectorA[5];
					B0vector <= vectorB3[5];
					inst_c0 <= C0;
					end
		114 :begin
					Avector <= vectorA[6];
					B0vector <= vectorB3[6];
					inst_c0 <= C0;
					end
		115 :begin
					Avector <= vectorA[7];
					B0vector <= vectorB3[7];
					inst_c0 <= C0;
					end
		116 :begin
					Avector <= vectorA[8];
					B0vector <= vectorB3[8];
					inst_c0 <= C0;
					end
		117 :begin
					Avector <= vectorA[9];
					B0vector <= vectorB3[0];
					inst_c0 <= 0;
					end
		118 :begin
					Avector <= vectorA[10];
					B0vector <= vectorB3[1];
					inst_c0 <= C0;
					end
		119 :begin
					Avector <= vectorA[11];
					B0vector <= vectorB3[2];
					inst_c0 <= C0;
					end
		120 :begin
					Avector <= vectorA[12];
					B0vector <= vectorB3[3];
					inst_c0 <= C0;
					end
		121 :begin
					Avector <= vectorA[13];
					B0vector <= vectorB3[4];
					inst_c0 <= C0;
					end
		122 :begin
					Avector <= vectorA[14];
					B0vector <= vectorB3[5];
					inst_c0 <= C0;
					end
		123 :begin
					Avector <= vectorA[15];
					B0vector <= vectorB3[6];
					inst_c0 <= C0;
					end
		124 :begin
					Avector <= vectorA[16];
					B0vector <= vectorB3[7];
					inst_c0 <= C0;
					end
		125 :begin
					Avector <= vectorA[17];
					B0vector <= vectorB3[8];
					inst_c0 <= C0;
					end
		126 :begin
					Avector <= vectorA[18];
					B0vector <= vectorB3[0];
					inst_c0 <= 0;
					end
		127 :begin
					Avector <= vectorA[19];
					B0vector <= vectorB3[1];
					inst_c0 <= C0;
					end
		128 :begin
					Avector <= vectorA[20];
					B0vector <= vectorB3[2];
					inst_c0 <= C0;
					end
		129 :begin
					Avector <= vectorA[21];
					B0vector <= vectorB3[3];
					inst_c0 <= C0;
					end
		130 :begin
					Avector <= vectorA[22];
					B0vector <= vectorB3[4];
					inst_c0 <= C0;
					end
		131 :begin
					Avector <= vectorA[23];
					B0vector <= vectorB3[5];
					inst_c0 <= C0;
					end
		132 :begin
					Avector <= vectorA[24];
					B0vector <= vectorB3[6];
					inst_c0 <= C0;
					end
		133 :begin
					Avector <= vectorA[25];
					B0vector <= vectorB3[7];
					inst_c0 <= C0;
					end
		134 :begin
					Avector <= vectorA[26];
					B0vector <= vectorB3[8];
					inst_c0 <= C0;
					end
		135 :begin
					Avector <= vectorA[27];
					B0vector <= vectorB3[0];
					inst_c0 <= 0;
					end
		136 :begin
					Avector <= vectorA[28];
					B0vector <= vectorB3[1];
					inst_c0 <= C0;
					end
		137 :begin
					Avector <= vectorA[29];
					B0vector <= vectorB3[2];
					inst_c0 <= C0;
					end
		138 :begin
					Avector <= vectorA[30];
					B0vector <= vectorB3[3];
					inst_c0 <= C0;
					end
		139 :begin
					Avector <= vectorA[31];
					B0vector <= vectorB3[4];
					inst_c0 <= C0;
					end
		140 :begin
					Avector <= vectorA[32];
					B0vector <= vectorB3[5];
					inst_c0 <= C0;
					end
		141 :begin
					Avector <= vectorA[33];
					B0vector <= vectorB3[6];
					inst_c0 <= C0;
					end
		142 :begin
					Avector <= vectorA[34];
					B0vector <= vectorB3[7];
					inst_c0 <= C0;
					end
		143 :begin
					Avector <= vectorA[35];
					B0vector <= vectorB3[8];
					inst_c0 <= C0;
					end

		//default : begin inst_c0 = 0;inst_c1=0;inst_c2=0;inst_c3=0;Avector=0;B0vector=0;B1vector=0;B2vector=0;B3vector=0; end
	
	endcase
end
end
	DW02_mac #(16,16) Mulmod1 (.A(Avector), .B(B0vector), .C(inst_c0), .TC(1'b1), .MAC(C0));
	/*DW02_mac #(16,16) Mulmod2 (.A(Avector), .B(B1vector), .C(inst_c1), .TC(1'b1), .MAC(C1));
	DW02_mac #(16,16) Mulmod3 (.A(Avector), .B(B2vector), .C(inst_c2), .TC(1'b1), .MAC(C2));
	DW02_mac #(16,16) Mulmod4 (.A(Avector), .B(B3vector), .C(inst_c3), .TC(1'b1), .MAC(C3));*/
	
always @(posedge clk)
	begin
	
	if(reset)
	begin Z00<=0;Z01<=0;Z02<=0;Z03<=0;
			    		Z10<=0;Z11<=0;Z12<=0;Z13<=0;
					Z20<=0;Z21<=0;Z22<=0;Z23<=0;
					Z30<=0;Z31<=0;Z32<=0;Z33<=0; end	
	else 		
	case (counterforB)
		 
		9 : begin
				Z00 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;
				/*Z01 <= (C1[31] != 1'b1)? C1[31:16]  : 16'b0;
				Z02 <= (C2[31] != 1'b1)? C2[31:16]  : 16'b0;
				Z03 <= (C3[31] != 1'b1)? C3[31:16]  : 16'b0;*/
					
			end	
		18 : begin
				Z10 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;
				/*Z11 <= (C1[31] != 1'b1)? C1[31:16]  : 16'b0;
				Z12 <= (C2[31] != 1'b1)? C2[31:16]  : 16'b0;
				Z13 <= (C3[31] != 1'b1)? C3[31:16]  : 16'b0;*/
				
			 end
		27 : begin
				Z20 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;
				/*Z21 <= (C1[31] != 1'b1)? C1[31:16]  : 16'b0;
				Z22 <= (C2[31] != 1'b1)? C2[31:16]  : 16'b0;
				Z23 <= (C3[31] != 1'b1)? C3[31:16]  : 16'b0;*/
					 
			 end	
		36 : begin
				Z30 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;
				/*Z31 <= (C1[31] != 1'b1)? C1[31:16]  : 16'b0;
				Z32 <= (C2[31] != 1'b1)? C2[31:16]  : 16'b0;
				Z33 <= (C3[31] != 1'b1)? C3[31:16]  : 16'b0;*/
				end
		45: begin
				Z01 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0; end
		54: begin
				Z11 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		63: begin
				Z21 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		72: begin
				Z31 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		81: begin
				Z02 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		90: begin
				Z12 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		99: begin
				Z22 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		108: begin
				Z32 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		117: begin
				Z03 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end						
		126: begin
				Z13 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		135: begin
				Z23 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	
		144: begin
				Z33 <= (C0[31] != 1'b1)? C0[31:16]  : 16'b0;end	 
		endcase	 
		
	end	        


endmodule
//`include "/afs/eos.ncsu.edu/dist/synopsys2013/syn/dw/sim_ver/DW02_mac.v"

module finalmultiplication(reset,
clk,m_vector_data,Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22,
Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42,
Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63,Z64,flag,countervalue,mulcounter,
finalValue0,finalValue1,finalValue2,finalValue3,finalValue4,finalValue5,finalValue6,finalValue7,enablefinalmultiplication
);
input  wire  clk,reset;
input wire [15:0] Z1,Z2,Z3,Z4,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z18,Z19,Z20,Z21,Z22;
input wire [15:0] Z23,Z24,Z25,Z26,Z27,Z28,Z29,Z30,Z31,Z32,Z33,Z34,Z35,Z36,Z37,Z38,Z39,Z40,Z41,Z42;
input wire [15:0] Z43,Z44,Z45,Z46,Z47,Z48,Z49,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z58,Z59,Z60,Z61,Z62,Z63,Z64;
input wire flag,enablefinalmultiplication;
input  wire [15:0]  m_vector_data; 
input wire [15:0] countervalue;
input wire [6:0] mulcounter;
/*reg[15:0] m_vector_data0[63:0];
reg[15:0] m_vector_data1[63:0];
reg[15:0] m_vector_data2[63:0];
reg[15:0] m_vector_data3[63:0];
reg[15:0] m_vector_data4[63:0];
reg[15:0] m_vector_data5[63:0];
reg[15:0] m_vector_data6[63:0];
reg[15:0] m_vector_data7[63:0];*/
reg[31:0] inst_c0;
/*reg[31:0] inst_c1;
reg[31:0] inst_c2;
reg[31:0] inst_c3;
reg[31:0] inst_c4;
reg[31:0] inst_c5;
reg[31:0] inst_c6;
reg[31:0] inst_c7;*/
reg[31:0] OValue0;
/*reg[31:0] OValue1;
reg[31:0] OValue2;
reg[31:0] OValue3;
reg[31:0] OValue4;
reg[31:0] OValue5;
reg[31:0] OValue6;
reg[31:0] OValue7;*/
output reg[15:0] finalValue0,finalValue1,finalValue2,finalValue3,finalValue4,finalValue5,finalValue6,finalValue7;
reg[15:0] m_vector_for_mac0;
/*reg[15:0] m_vector_for_mac1;
reg[15:0] m_vector_for_mac2;
reg[15:0] m_vector_for_mac3;
reg[15:0] m_vector_for_mac4;
reg[15:0] m_vector_for_mac5;
reg[15:0] m_vector_for_mac6;
reg[15:0] m_vector_for_mac7;*/
reg[15:0] z;

always@ (posedge clk)
begin
if(flag == 1'b1 )
/*begin
	if(countervalue>=321 && countervalue< 385)
	m_vector_data0 [countervalue-321] <= m_vector_data;
	else if(countervalue>=385 && countervalue <449)
	m_vector_data1[countervalue-385] <=m_vector_data;
	else if(countervalue>=449 && countervalue< 513)
	m_vector_data2[countervalue-449] <= m_vector_data;
	else if(countervalue>=513 && countervalue <577)
	m_vector_data3[countervalue-513] <=m_vector_data;
	else if(countervalue>=577 && countervalue< 641)
	m_vector_data4[countervalue-577] <= m_vector_data;
	else if(countervalue>=641 && countervalue <705)
	m_vector_data5[countervalue-641] <=m_vector_data;
	else if(countervalue>=705 && countervalue< 769)
	m_vector_data6[countervalue-705] <= m_vector_data;
	else if(countervalue>=769 && countervalue <833)
	m_vector_data7[countervalue-769] <=m_vector_data;
end*/
m_vector_for_mac0<=m_vector_data;
if(mulcounter == 64 || mulcounter==1)
inst_c0<=0;
else
inst_c0 <= OValue0;end
always@(posedge clk)
begin
		/*m_vector_for_mac0 = m_vector_data0[mulcounter-1];
		m_vector_for_mac1 = m_vector_data1[mulcounter-1];
		m_vector_for_mac2 = m_vector_data2[mulcounter-1];
		m_vector_for_mac3 = m_vector_data3[mulcounter-1];
		m_vector_for_mac4 = m_vector_data4[mulcounter-1];
		m_vector_for_mac5 = m_vector_data5[mulcounter-1];
		m_vector_for_mac6 = m_vector_data6[mulcounter-1];
		m_vector_for_mac7 = m_vector_data7[mulcounter-1];
		
		inst_c1 = OValue1;
		inst_c2 = OValue2;
		inst_c3 = OValue3;
		inst_c4 = OValue4;
		inst_c5 = OValue5;
		inst_c6 = OValue6;
		inst_c7 = OValue7;*/
		
case(mulcounter)
1 :begin z<=Z1;end
2 :begin z<=Z2;end
3 :z<=Z3;
4 :z<=Z4;
5 :z<=Z5; 
6 :z<=Z6;
7 :z<=Z7; 
8 :z<=Z8; 
9 :z<=Z9; 
10 :z<=Z10; 
11 :z<=Z11; 
12 :z<=Z12; 
13 :z<=Z13; 
14 :z<=Z14; 
15 :z<=Z15; 
16 :z<=Z16; 
17 :z<=Z17; 
18 :z<=Z18; 
19 :z<=Z19; 
20 :z<=Z20; 
20 :z<=Z20; 
21 :z<=Z21; 
22 :z<=Z22; 
23 :z<=Z23; 
24 :z<=Z24; 
25 :z<=Z25; 
26 :z<=Z26; 
27 :z<=Z27; 
28 :z<=Z28; 
29 :z<=Z29; 
30 :z<=Z30; 
31 :z<=Z31; 
32 :z<=Z32; 
33 :z<=Z33; 
34 :z<=Z34; 
35 :z<=Z35; 
36 :z<=Z36; 
37 :z<=Z37; 
38 :z<=Z38; 
39 :z<=Z39; 
40 :z<=Z40; 
41 :z<=Z41; 
42 :z<=Z42; 
43 :z<=Z43; 
44 :z<=Z44; 
45 :z<=Z45; 
46 :z<=Z46; 
47 :z<=Z47; 
48 :z<=Z48; 
49 :z<=Z49; 
50 :z<=Z50; 
51 :z<=Z51; 
52 :z<=Z52; 
53 :z<=Z53; 
54 :z<=Z54; 
55 :z<=Z55; 
56 :z<=Z56; 
57 :z<=Z57; 
58 :z<=Z58; 
59 :z<=Z59; 
60 :z<=Z60; 
61 :z<=Z61; 
62 :z<=Z62; 
63 :z<=Z63; 
64 :z<=Z64;	
endcase
end
	DW02_mac #(16,16) FinalMulmod1 (.A(z), .B(m_vector_for_mac0), .C(inst_c0), .TC(1'b1), .MAC(OValue0));
	/*DW02_mac #(16,16) FinalMulmod2 (.A(z), .B(m_vector_for_mac1), .C(inst_c1), .TC(1'b1), .MAC(OValue1));
	DW02_mac #(16,16) FinalMulmod3 (.A(z), .B(m_vector_for_mac2), .C(inst_c2), .TC(1'b1), .MAC(OValue2));
	DW02_mac #(16,16) FinalMulmod4 (.A(z), .B(m_vector_for_mac3), .C(inst_c3), .TC(1'b1), .MAC(OValue3));
	DW02_mac #(16,16) FinalMulmod5 (.A(z), .B(m_vector_for_mac4), .C(inst_c4), .TC(1'b1), .MAC(OValue4));
	DW02_mac #(16,16) FinalMulmod6 (.A(z), .B(m_vector_for_mac5), .C(inst_c5), .TC(1'b1), .MAC(OValue5));
	DW02_mac #(16,16) FinalMulmod7 (.A(z), .B(m_vector_for_mac6), .C(inst_c6), .TC(1'b1), .MAC(OValue6));
	DW02_mac #(16,16) FinalMulmod8 (.A(z), .B(m_vector_for_mac7), .C(inst_c7), .TC(1'b1), .MAC(OValue7));*/
always@(posedge clk)//OValue0,OValue1,OValue2,OValue3,OValue4,OValue5,OValue6,OValue7)
begin	
//finalValue0 = (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
if(reset)
begin
	finalValue0<=0;finalValue1<=0;finalValue2<=0;finalValue3<=0;finalValue4<=0;finalValue5<=0;finalValue6<=0;finalValue7<=0;
end
else begin
	case (countervalue)
	
	821 :   finalValue0 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	885:    finalValue1 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	949: 	finalValue2 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	1013: 	finalValue3 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	1077: 	finalValue4 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	1141: 	finalValue5 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	1205: 	finalValue6 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	1269: 	finalValue7 <= (OValue0[31] != 1'b1)? OValue0[31:16]  : 16'b0;
	endcase
end
end

//always@(OValue0,OValue0,OValue0,OValue0,OValue0,OValue0,OValue0,OValue0,OValue0,OValue0)
endmodule
					 
