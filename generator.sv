class transaction;
	rand bit [7:0] in;
	bit [15:0] sum;

endclass

class generator;
	transaction tr;
	mailbox mbx, rtn;
	extern function new(mailbox mbx, rtn);
	extern virtual task run();
	extern virtual task wrap_up();
endclass : generator

function generator::new(mailbox mbx, rtn);
	this.mbx=mbx;
	this.rtn=rtn;
endfunction : new

task generator::run();
	//write the run task here		






endtask : run

task generator::wrap_up();
	//empty for now
endtask : wrap_up





	
