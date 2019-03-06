test_file:
  file.managed:
    - name: /tmp/testfile
    - contents:  |
        this is creating a file with environment {{ pillar.get('environment') }}
        its working? {{ pillar.get('base_loaded') }}