BeforeDiscovery {
    $EntraIDPlan = Get-MtLicenseInformation -Product EntraID
}

Describe "CISA SCuBA" -Tag "MS.AAD", "MS.AAD.3.5", "CISA", "Security", "All" -Skip:( $EntraIDPlan -ne "Free" ) {
    It "MS.AAD.3.5: The authentication methods SMS, Voice Call, and Email One-Time Passcode (OTP) SHALL be disabled." {
        if(-not (Test-MtCisaMethodsMigration)) {
            Test-MtCisaWeakFactors | Should -Be $true -Because "all weak authentication methods are disabled."
        }
    }
}