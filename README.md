Downloads Cifar datasets directly from http://www.cs.toronto.edu/~kriz/cifar.html and converts them to Torch tables.

Cifar-100 format
----------------
Writes two files: cifar100-train.t7, cifar100-test.t7
Each of them is a table of the form:
```lua
th> c100 = torch.load('cifar100-train.t7')
th> print(c100)
{
        labelCoarse : ByteTensor - size: 50000
        data : ByteTensor - size: 50000x3x32x32
        label : ByteTensor - size: 50000
}
```

Cifar-10 format
---------------
Writes two files: cifar10-train.t7, cifar10-test.t7
Each of them is a table of the form:
```lua
th> c10 = torch.load('cifar10-train.t7')
th> print(c10)
{
        data : ByteTensor - size: 50000x3x32x32
        label : ByteTensor - size: 50000
}
```
