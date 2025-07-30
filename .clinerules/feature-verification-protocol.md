## Brief overview

This document establishes standardized procedures for verifying features/designs using MCP Playwright in development workflows. The guidelines ensure consistent quality assurance practices across projects.

## Verification Protocol

- **Change Identification**
  - All features/changes must be formally registered before testing
  - Impact mapping required for:
    - Dependent components
    - User workflows
    - System integrations

- **MCP Playwright Verification**
  - Mandatory test environment access before execution
  - Predefined test cases must cover:
    - Core functionality
    - Edge cases
    - Error handling
  - Metrics tracking requirements:
    - Response time (ms)
    - Success rate (%)
    - Behavior consistency across environments

- **Critical Analysis**
  - Specification comparison must use:
    - Original requirements documents
    - Acceptance criteria
    - User stories
  - Deviation classification system:
    - Critical (blocks functionality)
    - Major (impacts user experience)
    - Minor (cosmetic issues)

- **Documentation Standards**
  - Reports must include:
    - Test environment details
    - Step-by-step execution logs
    - Screenshots/videos of issues
  - Evidence requirements:
    - Before/after comparisons
    - Performance metrics graphs
    - Error logs

## Constraints

- **Time Limits**
  - Maximum 2 hours for test execution phase
  - Documentation completion required within 24 hours post-testing
- **Approval Requirements**
  - All critical deviations require stakeholder review
  - Major deviations need team consensus before resolution
