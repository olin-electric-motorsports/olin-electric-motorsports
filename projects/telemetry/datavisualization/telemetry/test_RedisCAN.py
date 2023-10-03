from RedisCAN import *
import cantools
import os, pty, serial
import testing.redis

master, slave = pty.openpty()
s_name = os.ttyname(slave)
m_name = os.ttyname(master)

send_bus = MakeBus(m_name)

db = cantools.db.load_file("data/dash.dbc")
message = db.get_message_by_name('brakelight_bspd_shutdown')
data_original = message.encode({'brake_analog_voltage_msb': 1/34, 'brake_analog_voltage_lsb': 1/139, 'cf': 0, 'bspdsense': 1/255, 'tsmssense': 1/255, 'left_e_stop_sense': 1/255, 'glvmssense': 1/255})

msg = can.Message(arbitration_id=message.frame_id,data=data_original,check=True)

reciv_bus = MakeBus(s_name)
r = fakeredis.FakeStrictRedis()
listener = RedisReader(redis_instance=r, dbc_file="data/dash.dbc")
can.Notifier(reciv_bus, [listener])

send_bus.send(msg)

print(r.dump('*'))