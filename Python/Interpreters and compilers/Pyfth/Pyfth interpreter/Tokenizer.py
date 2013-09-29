#def tokenize(text_file):
#    '''Goes through text file, splitting it into lines
#    and breaks each line into "tokens", returns 2d array of tokens'''
#    token_list = []
#    for line in text_file:
#        #print line
#        line_tokens = []
#        current_token = ''
#        for character in line:
#            if character == "#" and current_token == '':
#                break
#            elif character != " " and character != "\t" and character != "\n":
#                current_token += character
#            else:
#                if current_token != "":
#                    line_tokens.append(current_token)
#                    #print line_tokens
#                    current_token = ""
#        #print line_tokens
#        if current_token != "" and current_token != "\t":
#            line_tokens.append(current_token)
#        if line_tokens != []:
#            token_list+=line_tokens
#    #print token_list
#    return token_list

def tokenize(text_file):
    token_list = []
    string = 0
    escaped = 0
    for line in text_file:
        if not string:
            line_tokens= []
            current_token = ''
        for character in line:
            if not string:
                if character == '"' and current_token == '':
                    string = 1
                    token_list += line_tokens
                    line_tokens = []
                elif character == "#" and current_token == '':
                    break
                elif character != " " and character != "\t" and character != "\n":
                    current_token += character
                else:
                    if current_token != "":
                        line_tokens.append(current_token)
                        #print line_tokens
                        current_token = ""
            else:
                if not escaped:
                    if character == '"':
                        string = 0
                        token_list.append(current_token) 
                        current_token = ''
                    elif character == "\\":
                        escaped = 1
                    else:
                        current_token += character
                else:
                    escaped = 0
                    if character == '"':
                        current_token += '"'
                    if character == "n":
                        current_token += "\n"
        if not string:
            if current_token != "" and current_token != "\t":
                line_tokens.append(current_token)
            if line_tokens != []:
                token_list+=line_tokens
    #print token_list
    return token_list

