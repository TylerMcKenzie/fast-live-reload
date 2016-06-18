Feature: Monitoring files with a pattern should raise notifications when
  the specific files are being changed.

  Scenario: Test if changing of a file raises the event change when using absolute paths
    Given I monitor the test-data/test.* files running `pwd` whenever the file change
    When I change the 'unchanged_file.txt' file in that folder
    Then fast-live-reload doesn't do anything
    But when I change the 'test.txt' file in that folder
    Then the `pwd` command gets executed

  Scenario: Test if changing of a file raises the event change when using relative paths
    Given I monitor inside the test-data folder for test.* files, running `pwd` whenever the file change
    When I change the 'unchanged_file.txt' file in that folder
    Then fast-live-reload doesn't do anything
    But when I change the 'test.txt' file in that folder
    Then the `pwd` command gets executed
