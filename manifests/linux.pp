class base::linux {
    $base_packages = lookup(base::packages)
    $python_packages = lookup(base::python-packages)
    $gem_packages = lookup(base::gems)


  file { '/root/.vimrc' :
    source    => "puppet:///modules/${module_name}/vimrc",
    mode      => '0655',
    owner     => 'root',
  }

  package { $base_packages: ensure => latest, }
  package { $python_packages: ensure => latest, provider => 'pip3', }
  package { $gem_packages: ensure => latest, provider => 'gem', }

  # create certain users everwhere
  Accounts::Create_users::Localuser <| user == 'riley' |>
  Accounts::Create_users::Localuser <| user == 'kolby' |>

}
