require 'torch'

os.execute('wget -c http://www.cs.toronto.edu/~kriz/cifar-100-binary.tar.gz')
os.execute('tar -xvf cifar-100-binary.tar.gz')
local function convertCifar100BinToTorchTensor(inputFname, outputFname)
   local m=torch.DiskFile(inputFname, 'r'):binary()
   m:seekEnd()
   local length = m:position() - 1
   local nSamples = length / 3074 -- 1 coarse-label byte, 1 fine-label byte, 3072 pixel bytes

   assert(nSamples == math.floor(nSamples), 'expecting numSamples to be an exact integer')
   m:seek(1)

   local coarse = torch.ByteTensor(nSamples)
   local fine = torch.ByteTensor(nSamples)
   local data = torch.ByteTensor(nSamples, 3, 32, 32)
   for i=1,nSamples do
      coarse[i] = m:readByte()
      fine[i]   = m:readByte()
      local store = m:readByte(3072)
      data[i]:copy(torch.ByteTensor(store))
   end

   local out = {}
   out.data = data
   out.label = fine
   out.labelCoarse = coarse
   print(out)
   torch.save(outputFname, out)
end

convertCifar100BinToTorchTensor('cifar-100-binary/train.bin', 'cifar100-train.t7')
convertCifar100BinToTorchTensor('cifar-100-binary/test.bin', 'cifar100-test.t7')
