*** Settings ***
Resource    ./import_files.robot
Resource    ./variables.robot
Resource    ./capture_screenshot.robot



*** Keywords ***
#Keyword will switch between frame and navigation tree based on isParent value  
Switch_Frames
    [Arguments]    ${isParent}    ${Framelocator}
    Run Keyword If    ${isParent}==True    Unselect Frame  
    Run Keyword If    ${isParent}==False    Select Frame    ${Framelocator}        
    Sleep    5 seconds
    
Select_Projects_Tab
    Log    click projects tab in left tree
     Switch_Frames    True    ${Framelocator}   
    Click Element    xpath=${ProjectTabLocator}
    Switch_Frames    False    ${Framelocator}
    Take_screenshot    Project
    Sleep    5s
    
Open_Project
    Log    select project Code for test
    Click Element    ${Projectcodefilterlocator}
    Input Text    ${Projectcodefilterlocator}    ${ProjectCode}
    Sleep    5s
    Click Element    ${Projectcodefilterarrow}
    Sleep    10s
    Click Element    ${equaltofilter}
    Sleep    10s
    Double Click Element    ${Openproject}
    Sleep    5s
     Switch_Frames    True    ${Framelocator}
    Sleep    10s
     Click Element    ${Expandalllocator}
     Sleep    5s
    
 Logout
    Log    this will go to Admin tray on top right corner and click logout
     Switch_Frames    True    ${Framelocator}
     Click Element    ${UserName}
     Sleep    5s 
     Take_Screenshot    Project
     Click Element    ${Logout}
    

