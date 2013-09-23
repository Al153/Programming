def tokenize(text_file):
    '''Goes through text file, splitting it into lines
    and breaks each line into "tokens", returns 2d array of tokens'''
    token_list = []
    for line in text_file:
        #print line
        line_tokens = []
        current_token = ''
        for character in line:
            if character == "#" and current_token == []:
                break
            elif character != " " and character != "\t" and character != "\n":
                current_token += character
            else:
                if current_token != "":
                    line_tokens.append(current_token)
                    #print line_tokens
                    current_token = ""
        #print line_tokens
        if current_token != "" and current_token != "\t":
            line_tokens.append(current_token)
        if line_tokens != []:
            token_list+=line_tokens
    return token_list

