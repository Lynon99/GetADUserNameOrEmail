do {
    # Code to be executed as long as the condition is true

# Ask the user for input
$userInput = Read-Host "Please enter an SIU Active Directory username or email:"

Set-ExecutionPolicy RemoteSigned






# Check if the input is an AD username
if ($userInput -match "^[A-Za-z0-9._-]+$") {
    Write-Host "You entered an AD username: $userInput"
    Get-ADUser $userInput -properties *
}
# Check if the input is an email address
elseif ($userInput -match "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$") {
    Write-Host "You entered an email address: $userInput"
    # Add your code to perform actions for email addresses here
    Get-ADUser -filter {EmailAddress -eq $userInput} -Properties *
}
else {
    Write-Host "Invalid input. Please enter a valid AD username or email."
}

 # Prompt to continue
    $continue = Read-Host "Do you want to enter another username or email (y/n)?"
} while ($continue -eq 'y')