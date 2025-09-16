#!/bin/bash

# Interactive manual issue creation guide
# This script provides step-by-step instructions for manually creating GitHub issues

REPO_URL="https://github.com/Mick199/skills-modernize-your-legacy-code-with-github-copilot"
NEW_ISSUE_URL="$REPO_URL/issues/new"

echo "========================================"
echo "🎯 Manual GitHub Issues Creation Guide"
echo "========================================"
echo ""
echo "Repository: $REPO_URL"
echo "Create issues at: $NEW_ISSUE_URL"
echo ""

cat << 'EOF'
📋 STEP-BY-STEP INSTRUCTIONS:

1. Open your web browser
2. Go to: https://github.com/Mick199/skills-modernize-your-legacy-code-with-github-copilot/issues/new
3. For each issue below:
   - Copy the TITLE into the "Title" field
   - Copy the BODY into the issue description field
   - Add the LABELS (create them if they don't exist)
   - Click "Submit new issue"

========================================
📝 ISSUE #1 of 12
========================================

TITLE:
User Login Authentication (US-006)

LABELS:
enhancement, security, authentication

BODY:
## User Story
**As a** student  
**I want to** log into the system with my credentials  
**So that** only I can access my account information  

## Epic
User Authentication & Security

## Acceptance Criteria
- [ ] Given I start the application
- [ ] When I enter my username and password
- [ ] Then the system authenticates my credentials
- [ ] And grants access to my personal account
- [ ] Or displays an error for invalid credentials

## Priority
High

## Current Implementation
❌ Not implemented (single account system)

## Technical Notes
- Requires implementation of user database/storage
- Need to design authentication mechanism
- Consider password security standards
- May require session management

========================================
📝 ISSUE #2 of 12
========================================

TITLE:
Account Security - Session Timeout (US-007)

LABELS:
enhancement, security, session-management

BODY:
## User Story
**As a** student  
**I want to** have my session automatically timeout  
**So that** my account remains secure if I forget to log out  

## Epic
User Authentication & Security

## Acceptance Criteria
- [ ] Given I am logged into the system
- [ ] When I am inactive for more than 15 minutes
- [ ] Then the system automatically logs me out
- [ ] And requires re-authentication for access

## Priority
Medium

## Current Implementation
❌ Not implemented

## Technical Notes
- Requires session tracking
- Need to implement activity monitoring
- Configure timeout duration (15 minutes)
- Handle cleanup of session data

========================================
📝 ISSUE #3 of 12
========================================

TITLE:
Transaction History Viewing (US-008)

LABELS:
enhancement, feature, reporting

BODY:
## User Story
**As a** student  
**I want to** view my transaction history  
**So that** I can track my spending and deposits over time  

## Epic
Enhanced Account Features

## Acceptance Criteria
- [ ] Given I am logged into my account
- [ ] When I select "View Transaction History"
- [ ] Then the system displays a list of my recent transactions
- [ ] Including date, type (credit/debit), amount, and resulting balance

## Priority
High

## Current Implementation
❌ Not implemented (no transaction logging)

## Technical Notes
- Requires transaction logging mechanism
- Need database schema for transaction storage
- Design transaction display interface
- Consider pagination for large transaction lists
- Include filtering/sorting capabilities

========================================
📝 ISSUE #4 of 12
========================================

TITLE:
Balance Alerts and Notifications (US-009)

LABELS:
enhancement, feature, notifications

BODY:
## User Story
**As a** student  
**I want to** set up balance alerts  
**So that** I'm notified when my balance falls below a certain amount  

## Epic
Enhanced Account Features

## Acceptance Criteria
- [ ] Given I am in account settings
- [ ] When I set a minimum balance threshold
- [ ] Then the system warns me when my balance approaches this limit
- [ ] And prevents transactions that would exceed the threshold if desired

## Priority
Medium

## Current Implementation
❌ Not implemented

## Technical Notes
- Requires user preferences/settings storage
- Need notification system design
- Implement threshold checking logic
- Consider different types of alerts (warning vs blocking)
- May need email/SMS notification capability

========================================
📝 ISSUE #5 of 12
========================================

TITLE:
Transfer Between Multiple Accounts (US-010)

LABELS:
enhancement, feature, multi-account

BODY:
## User Story
**As a** student  
**I want to** transfer money between different account types  
**So that** I can manage multiple accounts (checking, savings, meal plan)  

## Epic
Enhanced Account Features

## Acceptance Criteria
- [ ] Given I have multiple accounts
- [ ] When I select "Transfer Funds"
- [ ] Then I can choose source and destination accounts
- [ ] And transfer a specified amount between them
- [ ] With appropriate balance validations

## Priority
Medium

## Current Implementation
❌ Not implemented (single account only)

## Technical Notes
- Requires multi-account data model
- Need account type definitions
- Implement transfer validation logic
- Design transfer interface
- Consider transaction atomicity (all-or-nothing transfers)

========================================
📝 ISSUE #6 of 12
========================================

TITLE:
Monthly Spending Reports (US-011)

LABELS:
enhancement, reporting, analytics

BODY:
## User Story
**As a** student  
**I want to** generate monthly spending reports  
**So that** I can better understand my spending patterns  

## Epic
Reporting & Analytics

## Acceptance Criteria
- [ ] Given I have transaction history
- [ ] When I request a monthly report
- [ ] Then the system generates a summary showing:
  - [ ] Total credits and debits for the month
  - [ ] Spending categories (if applicable)
  - [ ] Average daily balance
  - [ ] Comparison to previous months

## Priority
Low

## Current Implementation
❌ Not implemented

## Technical Notes
- Requires transaction history (dependent on US-008)
- Need report generation engine
- Design report format and layout
- Consider different report periods (weekly, monthly, yearly)
- May include charts/graphs for visualization

========================================
📝 ISSUE #7 of 12
========================================

TITLE:
Export Account Data (US-012)

LABELS:
enhancement, reporting, data-export

BODY:
## User Story
**As a** student  
**I want to** export my account data  
**So that** I can import it into personal finance software  

## Epic
Reporting & Analytics

## Acceptance Criteria
- [ ] Given I have account data
- [ ] When I select "Export Data"
- [ ] Then the system generates a downloadable file (CSV, PDF)
- [ ] Containing my transaction history and account information

## Priority
Low

## Current Implementation
❌ Not implemented

## Technical Notes
- Requires transaction history (dependent on US-008)
- Support multiple export formats (CSV, PDF, Excel)
- Design export data structure
- Consider data privacy and security for exports
- Implement file download mechanism

========================================
📝 ISSUE #8 of 12
========================================

TITLE:
Account Recovery System (US-013)

LABELS:
enhancement, security, account-recovery

BODY:
## User Story
**As a** student  
**I want to** recover my account if I forget my password  
**So that** I don't lose access to my financial information  

## Epic
System Administration

## Acceptance Criteria
- [ ] Given I have forgotten my password
- [ ] When I select "Forgot Password"
- [ ] Then the system guides me through a secure recovery process
- [ ] Using email verification or security questions

## Priority
High

## Current Implementation
❌ Not implemented

## Technical Notes
- Requires email system integration
- Need secure token generation for recovery
- Design security questions mechanism
- Implement password reset workflow
- Consider rate limiting for security

========================================
📝 ISSUE #9 of 12
========================================

TITLE:
Data Persistence Implementation (US-014)

LABELS:
enhancement, infrastructure, database

BODY:
## User Story
**As a** student  
**I want to** have my account data saved permanently  
**So that** my balance and history are maintained between sessions  

## Epic
System Administration

## Acceptance Criteria
- [ ] Given I make transactions in the system
- [ ] When I log out and log back in later
- [ ] Then my balance and transaction history are preserved
- [ ] And reflect all previous activities

## Priority
High

## Current Implementation
❌ Not implemented (data lost on program exit)

## Technical Notes
- Replace working storage with database
- Choose appropriate database technology
- Design data schema for accounts and transactions
- Implement data access layer
- Consider data backup and recovery

========================================
📝 ISSUE #10 of 12
========================================

TITLE:
Web Interface Development (US-015)

LABELS:
enhancement, ui, web-interface

BODY:
## User Story
**As a** student  
**I want to** access the system through a web browser  
**So that** I can manage my account from any device  

## Epic
System Modernization

## Acceptance Criteria
- [ ] System is accessible via web browser
- [ ] All current functionality available through web interface
- [ ] Responsive design for different screen sizes
- [ ] Modern, intuitive user interface

## Priority
Medium

## Current Implementation
❌ Terminal-based interface only

## Technical Notes
- Choose web framework/technology
- Design responsive UI/UX
- Implement web-based authentication
- Convert COBOL business logic to web-compatible language
- Consider accessibility standards

========================================
📝 ISSUE #11 of 12
========================================

TITLE:
Mobile Compatibility (US-016)

LABELS:
enhancement, mobile, responsive-design

BODY:
## User Story
**As a** student  
**I want to** use the system on my mobile device  
**So that** I can check my balance and make transactions on the go  

## Epic
System Modernization

## Acceptance Criteria
- [ ] System works on mobile browsers
- [ ] Touch-friendly interface
- [ ] Optimized for small screens
- [ ] Fast loading on mobile networks

## Priority
Medium

## Current Implementation
❌ Not mobile-friendly

## Technical Notes
- Requires web interface (dependent on US-015)
- Implement responsive design
- Optimize for mobile performance
- Consider progressive web app (PWA) features
- Test on various mobile devices

========================================
📝 ISSUE #12 of 12
========================================

TITLE:
API Integration Capabilities (US-017)

LABELS:
enhancement, api, integration

BODY:
## User Story
**As a** system administrator  
**I want to** integrate with external financial systems  
**So that** students can link their campus accounts with banking services  

## Epic
System Modernization

## Acceptance Criteria
- [ ] RESTful API endpoints available
- [ ] Secure authentication for API access
- [ ] Documentation for API usage
- [ ] Support for common financial data formats

## Priority
Low

## Current Implementation
❌ No API capabilities

## Technical Notes
- Design RESTful API architecture
- Implement API authentication (OAuth, JWT)
- Create API documentation
- Consider rate limiting and security
- Design data exchange formats (JSON)

========================================
🎉 COMPLETION
========================================

You have successfully created all 12 GitHub issues!

Next steps:
1. Review the issues in your repository
2. Add them to project boards if needed
3. Assign team members
4. Set milestones
5. Begin development prioritization

View all issues at:
https://github.com/Mick199/skills-modernize-your-legacy-code-with-github-copilot/issues

========================================
EOF

echo ""
echo "✅ All issue details have been displayed above"
echo "📋 Total issues to create: 12"
echo "🔗 Create them at: $NEW_ISSUE_URL"
echo ""