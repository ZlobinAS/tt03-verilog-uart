import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

getsigl = 0b000000010
getsigh = 0b000000000

def getuartbyte(data):
    rmost = bin(data).rindex("0") - 1
    if rmost < 0:
        rmost = 1
    return (data & ((1 << rmost)-1)) >> (rmost-8)

@cocotb.test()
async def z_uart(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    dut._log.info("reset, init RX")
    dut.rst.value = 1
    dut.rx.value = 1
    await ClockCycles(dut.clk, 10)
    dut.rst.value = 0

    dut._log.info("read signature")
    for i in range(9):
        dut.rx.value = (getsigh >> (8-i))&1
        await ClockCycles(dut.clk, 1)
    dut.rx.value = 1

    data = 0b0
    for i in range(20):
        data = (data << 1) | dut.tx.value
        await ClockCycles(dut.clk, 1)

    rxdata = getuartbyte(data)
    dut._log.info(rxdata)
    assert rxdata == 0xDE

    await ClockCycles(dut.clk, 10)

    for i in range(9):
        dut.rx.value = (getsigl >> (8-i))&1
        await ClockCycles(dut.clk, 1)
    dut.rx.value = 1

    data = 0b0
    for i in range(20):
        data = (data << 1) | dut.tx.value
        await ClockCycles(dut.clk, 1)

#    rmost = bin(data).rindex("0") - 1
#    rxdata = (data & ((1 << rmost)-1)) >> (rmost-8)
    rxdata = getuartbyte(data)
    dut._log.info(rxdata)
    assert rxdata == 0xDA

