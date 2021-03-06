require 'package'

class Freetype < Package
  description 'FreeType is a freely available software library to render fonts.'
  homepage 'https://www.freetype.org/'
  version '2.9'
  source_url 'http://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.bz2'
  source_sha256 'e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'expat'
  depends_on 'libpng'   # freetype needs zlib optionally. zlib is also the dependency of libpng
  depends_on 'bz2'
  
  def self.build
      system "./configure \
              CFLAGS=\" -fPIC\" \
              --prefix=#{CREW_PREFIX} \
              --libdir=#{CREW_LIB_PREFIX}"
      system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
