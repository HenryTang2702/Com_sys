class VMTranslator:

    def vm_push(segment, offset):
        '''Generate Hack Assembly code for a VM push operation'''
        if segment == "constant":
            code = f"""
            @{offset}
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """
        elif segment in ["static", "temp", "pointer"]:
            code = f"""
            @{segment.upper()}.{offset}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """
        else:
            code = f"""
            @{segment.upper()}
            D=M
            @{offset}
            A=D+A
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
            """
        return code

    def vm_pop(segment, offset):
        '''Generate Hack Assembly code for a VM pop operation'''
        if segment in ["static", "pointer", "temp"]:
            code = f"""
            @SP
            AM=M-1
            D=M
            @{segment.upper()}.{offset}
            M=D
            """
        else:
            code = f"""
            @{offset}
            D=A
            @{segment.upper()}
            D=D+M
            @R5
            M=D
            @SP
            AM=M-1
            D=M
            @R5
            A=M
            M=D
            """
        return code
        

    def vm_add():
        '''Generate Hack Assembly code for a VM add operation'''

        return """@SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        M=D+M
        @SP
        M=M+1"""
    

    def vm_sub():
        '''Generate Hack Assembly code for a VM sub operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        M=M-D
        @SP
        M=M+1
        """

    def vm_neg():
        '''Generate Hack Assembly code for a VM neg operation'''
        return """
        @SP
        AM=M-1
        M=-M
        @SP
        M=M+1
        """

    def vm_eq():
        '''Generate Hack Assembly code for a VM eq operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        D=M-D
        @EQUAL
        D;JEQ
        @SP
        A=M
        M=0
        @SP
        M=M+1
        @END
        0;JMP
        (EQUAL)
        @SP
        A=M
        M=-1
        @SP
        M=M+1
        (END)
        """

    def vm_gt():
        '''Generate Hack Assembly code for a VM gt operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        D=M-D
        @GREATER
        D;JGT
        @SP
        A=M
        M=0
        @SP
        M=M+1
        @END
        0;JMP
        (GREATER)
        @SP
        A=M
        M=-1
        @SP
        M=M+1
        (END)
        """

    def vm_lt():
        '''Generate Hack Assembly code for a VM lt operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        D=M-D
        @LESS
        D;JLT
        @SP
        A=M
        M=0
        @SP
        M=M+1
        @END
        0;JMP
        (LESS)
        @SP
        A=M
        M=-1
        @SP
        M=M+1
        (END)
        """

    def vm_and():
        '''Generate Hack Assembly code for a VM and operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        M=D&M
        @SP
        M=M+1"""

    def vm_or():
        '''Generate Hack Assembly code for a VM or operation'''
        return """
        @SP
        AM=M-1
        D=M
        @SP
        AM=M-1
        M=D|M
        @SP
        M=M+1"""

    def vm_not():
        '''Generate Hack Assembly code for a VM not operation'''
        return """
        @SP
        AM=M-1
        M=!M
        @SP
        M=M+1"""

    def vm_label(label):
        '''Generate Hack Assembly code for a VM label operation'''
        return """
        ({})
        """.format(label)
        

    def vm_goto(label):
        '''Generate Hack Assembly code for a VM goto operation'''
        
        return """
        @{}
        0;JMP
        """.format(label)
            

    def vm_if(label):
        '''Generate Hack Assembly code for a VM if-goto operation'''
        return """
        @SP
        AM=M-1
        D=M
        @{}
        D;JNE
        """.format(label)

    def vm_function(function_name, n_vars):
        '''Generate Hack Assembly code for a VM function operation'''
        code = f"""
        ({function_name})
        """
        for i in range(n_vars):
            code += VMTranslator.vm_push("constant", 0)
        return code

    def vm_call(function_name, n_args):
        '''Generate Hack Assembly code for a VM call operation'''
        code = """
        @retAddr
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        @SP
        D=M
        @5
        D=D-A
        @{n_args}
        D=D-A
        @ARG
        M=D
        @SP
        D=M
        @LCL
        M=D
        @{function_name}
        0;JMP
        (retAddr)
        """.format(function_name=function_name, n_args=n_args)
        return code

    def vm_return():
        '''Generate Hack Assembly code for a VM return operation'''
        code = """
        @LCL
        D=M
        @5
        M=D
        @5
        A=D-A
        D=M
        @6
        M=D
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        @ARG
        D=M+1
        @SP
        M=D
        @5
        AM=M-1
        D=M
        @THAT
        M=D
        @5
        AM=M-1
        D=M
        @THIS
        M=D
        @5
        AM=M-1
        D=M
        @ARG
        M=D
        @5
        AM=M-1
        D=M
        @LCL
        M=D
        @6
        A=M
        0;JMP
        """
        return code

# A quick-and-dirty parser when run as a standalone script.
if __name__ == "__main__":
    import sys
    if(len(sys.argv) > 1):
        with open(sys.argv[1], "r") as a_file:
            for line in a_file:
                tokens = line.strip().lower().split()
                if(len(tokens)==1):
                    if(tokens[0]=='add'):
                        print(VMTranslator.vm_add())
                    elif(tokens[0]=='sub'):
                        print(VMTranslator.vm_sub())
                    elif(tokens[0]=='neg'):
                        print(VMTranslator.vm_neg())
                    elif(tokens[0]=='eq'):
                        print(VMTranslator.vm_eq())
                    elif(tokens[0]=='gt'):
                        print(VMTranslator.vm_gt())
                    elif(tokens[0]=='lt'):
                        print(VMTranslator.vm_lt())
                    elif(tokens[0]=='and'):
                        print(VMTranslator.vm_and())
                    elif(tokens[0]=='or'):
                        print(VMTranslator.vm_or())
                    elif(tokens[0]=='not'):
                        print(VMTranslator.vm_not())
                    elif(tokens[0]=='return'):
                        print(VMTranslator.vm_return())
                elif(len(tokens)==2):
                    if(tokens[0]=='label'):
                        print(VMTranslator.vm_label(tokens[1]))
                    elif(tokens[0]=='goto'):
                        print(VMTranslator.vm_goto(tokens[1]))
                    elif(tokens[0]=='if-goto'):
                        print(VMTranslator.vm_if(tokens[1]))
                elif(len(tokens)==3):
                    if(tokens[0]=='push'):
                        print(VMTranslator.vm_push(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='pop'):
                        print(VMTranslator.vm_pop(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='function'):
                        print(VMTranslator.vm_function(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='call'):
                        print(VMTranslator.vm_call(tokens[1],int(tokens[2])))

        