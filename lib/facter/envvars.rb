Facter.add('envvars') do
  setcode do
    Facter::Util::Resolution.exec('/bin/env')
  end
end
