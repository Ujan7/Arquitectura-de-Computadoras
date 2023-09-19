module flopr_tb;

    // Parámetros
    parameter N = 64; // Ancho de los buses

    // Señales del testbench
    logic clk = 0, reset;
    logic [N - 1 : 0] d, q;

    // Contador para manejar el reset
    integer count = 0;

    // Instancia del módulo bajo prueba
    flopr #(N) dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );
	 
    // Generación del reloj con período de 10 ns (100 MHz)
    initial begin
        forever #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        // Simulación durante varios ciclos de reloj
        repeat (5) begin
            reset = 1; // Activa el reset
            #52;
            reset = 0; // Desactiva el reset
        end

        // Ingresar 10 números de 64 bits
        repeat (10) begin
            d = $random; // Valor aleatorio de 64 bits
            #10; // Esperar 10 ns para el próximo ciclo
        end

        // Verificar las salidas
        repeat (10) begin
            #10;
            if (count < 5) begin
                if (q !== 64'b0) $display("Error en el ciclo %0d, q = %h, se esperaba 0", count, q);
            end else begin
                if (q !== d) $display("Error en el ciclo %0d, q = %h, se esperaba %h", count, q, d);
            end
            count++;
        end

        $finish;
    end

endmodule



