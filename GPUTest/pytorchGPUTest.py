import torch

print(torch.cuda.current_device())
# Out[2]: 0

print(torch.cuda.device(0))
# Out[3]: <torch.cuda.device at 0x7efce0b03be0>

print(torch.cuda.device_count())
# Out[4]: 1

print(torch.cuda.get_device_name(0))
# Out[5]: 'GeForce GTX 950M'

print(torch.cuda.is_available())
# Out[6]: True