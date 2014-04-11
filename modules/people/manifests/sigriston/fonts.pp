class people::sigriston::fonts {
  require people::sigriston::config

  # powerline fonts
  $powerlinefonts = "${boxen::config::srcdir}/powerline-fonts"
  repository { $powerlinefonts:
    source  => 'Lokaltog/powerline-fonts',
    require => File[$boxen::config::srcdir]
  }
  $fontsdest = $people::sigriston::config::fonts_dir
  exec { 'Install DejaVuSansMono Font':
    command => "cp ${powerlinefonts}/DejaVuSansMono/*.ttf ${fontsdest}",
    creates => "${fontsdest}/DejaVu Sans Mono for Powerline.ttf",
    require => Repository[$powerlinefonts]
  }
}
