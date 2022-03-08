from math import pi


class Adder:
    def __init__(self,value):
        self.value = value
    def __add__(self,B):
        if isinstance(B,Adder):
            return Adder(self.value+B.value)
        else:
            return Adder(self.value+B)

class Str(str):
    def is_repeatance (self,s):
        if type(s)!=str or s=='':
            return False
        if self.replace(s,'')=='':
            return True
        else:
            return False
    def is_palindrom (self):
        if self.lower()==self[::-1].lower():
            return True
        else:
            return False
        
 
class Cylinder:
    @staticmethod
    def make_area(d, h):
        circle = pi * d ** 2 / 4
        side = pi * d * h
        return round(circle*2 + side, 2)

    def __init__(self, di, hi):
        self.dia = di
        self.h = hi

    def __setattr__(self,attr,value):
        if attr=='area':
            raise AttributeError('You can\'t chande this attribute')
        else:
            self.__dict__[attr]=value
            if hasattr(self,'dia') and hasattr(self,'h'):
                self.__dict__['area']=self.make_area(self.__dict__['dia'],self.__dict__['h'])
