require 'torch'
require 'image'

c10 = torch.load('cifar10-train.t7')
image.display{image=c10.data[{{1,1000},{},{},{}}], nrow=40}

c100 = torch.load('cifar100-train.t7')
image.display{image=c100.data[{{1,1000},{},{},{}}], nrow=40}
