#!/bin/bash
PASSWORD=Mmxlb369369@
#ssh-keygen
auto_ssh_copy_id() {
            expect -c "set timeout -1;
                    spawn ssh-copy-id $1;
                            expect {
                                        *(yes/no)* {send -- yes\r;exp_continue;  }
                                                    *assword:* {send -- $2\r;exp_continue;}
                                                                eof        {exit 0;}
                                                                        }";
                                                                }

                                                                cat nodes | while read host
                                                        do
                                                                {
                                                                            auto_ssh_copy_id $host $PASSWORD
                                                                    }&wait
                                                            done
