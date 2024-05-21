class monitor;
	virtual ac_if.test acif;
	transaction tr;
	mailbox mbx;
	extern function new(mailbox mbx, input virtual ac_if.test acif);
	extern virtual task run();
	extern virtual task wrap_up();
endclass : monitor

function monitor::new(mailbox mbx, input virtual ac_if.test acif);
	this.mbx=mbx;
	this.acif = acif;
	tr=new();
endfunction : new


task monitor::run();
    // Wait for reset to be applied and removed
    wait (acif.cb.rst == 1);
    wait (acif.cb.rst == 0);

    // Monitor DUT output in each clock cycle
    for (int i = 0; i < 100; i++) begin
        @(posedge acif.clk);
        tr.sum = acif.cb.sum;  // Read DUT sum output from clocking block
        mbx.put(tr);           // Send the transaction to the scoreboard
        $display("Captured sum: %0d", tr.sum);  // Debug statement
    end
endtask : run

task monitor::wrap_up();
	//empty for now
endtask : wrap_up




	
