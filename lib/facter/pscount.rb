Facter.add('pscount') do
  setcode do
    Facter::Util::Resolution.exec('/bin/ps -e --no-headers | /usr/bin/wc -l')
  end
end
