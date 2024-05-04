
############# Random FunFacts ##################
# A simple script to post random funfacts in a #
# channel.                                     #
#                                              #
# The bot randomly fetch funfacts from address #
# http://www.quotability.com/ and post it      #
# to the alocated channel in ever x minutes.   #
#                                              #
#                                              #
# Installation:                                #
# pop the script in your script folder and add #
# source scripts/quote.tcl to your eggdrop conf #
# file rehash / restart the bot.               #
#   ** THIS SCRIPT IS A MODIFIED SCRIPT        #
#                - Error                       #
#         irc.ethicalslacker.ne                #
#               #Error                         #
################################################
                          


 package require http


################################################
#                Configuration                 #
#                                              #
#      Alocate a channel for the bot           #
################################################

set channel "#Error"


#################################################
# Random facts timer. change it according to    #
# your needs.                                   #
#################################################

set time 7

#################################################
# Please dont touch anything bellow unless you  #
# know what you are doing.                      #
#################################################


if {[string compare [string index $time 0] "!"] == 0} { set timer [string range $time 1 end] } { set timer [expr $time * 60] } 
if {[lsearch -glob [utimers] "* quote *"] == -1} { utimer $timer quote }


proc quote {} { 
global channel time quote timer 
set url "http://www.quotability.com/"
set page [http::data [http::geturl $url]]
regexp {<i>(.*?)<\/i>} $page a quote 
#foreach line $quote { putserv "PRIVMSG $channel :Once a wise man said: $quote" } 
putserv "PRIVMSG $channel :Once a wise man said: $quote" 
if {[lsearch -glob [utimers] "* quote *"] == -1} { utimer $timer quote } 
}


putlog "RandomQuotes.tcl 1.0 (Random Quote ) by Error Loaded."
