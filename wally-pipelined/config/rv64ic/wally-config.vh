//////////////////////////////////////////
// wally-config.vh
//
// Written: David_Harris@hmc.edu 4 January 2021
// Modified: 
//
// Purpose: Specify which features are configured
//          Macros to determine which modes are supported based on MISA
// 
// A component of the Wally configurable RISC-V project.
// 
// Copyright (C) 2021 Harvey Mudd College & Oklahoma State University
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, 
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software 
// is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS 
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT 
// OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
///////////////////////////////////////////

// include shared configuration
`include "wally-shared.vh"

`define BUILDROOT 0
`define BUSYBEAR 0

// RV32 or RV64: XLEN = 32 or 64
`define XLEN 64

// MISA RISC-V configuration per specification
`define MISA (32'h00000104 | 0 << 5 | 0 << 3 | 1 << 18 | 1 << 20 | 1 << 12 | 1 << 0)
`define ZCSR_SUPPORTED 1
`define COUNTERS 31
`define ZCOUNTERS_SUPPORTED 1

// Microarchitectural Features
`define UARCH_PIPELINED 1
`define UARCH_SUPERSCALR 0
`define UARCH_SINGLECYCLE 0
`define MEM_DCACHE 0
`define MEM_DTIM 1
`define MEM_ICACHE 0
`define MEM_VIRTMEM 1
`define VECTORED_INTERRUPTS_SUPPORTED 1

`define ITLB_ENTRY_BITS 5
`define DTLB_ENTRY_BITS 5

// Address space
`define RESET_VECTOR 64'h0000000080000000

// Bus Interface width
`define AHBW 64

// Peripheral Physiccal Addresses
// Peripheral memory space extends from BASE to BASE+RANGE
// Range should be a thermometer code with 0's in the upper bits and 1s in the lower bits

`define BOOTTIMBASE   32'h00000000
`define BOOTTIMRANGE  32'h00003FFF
`define TIMBASE       32'h80000000
`define TIMRANGE      32'h07FFFFFF
`define CLINTBASE  32'h02000000
`define CLINTRANGE 32'h0000FFFF
`define GPIOBASE   32'h10012000
`define GPIORANGE  32'h000000FF
`define UARTBASE   32'h10000000
`define UARTRANGE  32'h00000007
`define PLICBASE   32'h0C000000
`define PLICRANGE  32'h03FFFFFF

// Test modes

// Tie GPIO outputs back to inputs
`define GPIO_LOOPBACK_TEST 1

// Busybear special CSR config to match OVPSim
`define OVPSIM_CSR_CONFIG 0

// Hardware configuration
`define UART_PRESCALE 1

// Interrupt configuration
`define PLIC_NUM_SRC 4
// comment out the following if >=32 sources
`define PLIC_NUM_SRC_LT_32
`define PLIC_GPIO_ID 3
`define PLIC_UART_ID 4

`define TWO_BIT_PRELOAD "../config/rv64ic/twoBitPredictor.txt"
`define BTB_PRELOAD "../config/rv64ic/BTBPredictor.txt"
`define BPRED_ENABLED 1
`define BPTYPE "BPGSHARE" // BPLOCALPAg or BPGLOBAL or BPTWOBIT or BPGSHARE
`define TESTSBP 0

