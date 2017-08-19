file (GLOB BTFI_SRCS sax.cc Codec.cc Document.cc Element.cc
                    Name.cc Value.cc MutableAttributes.cc
                    Vocabulary.cc VocabSimple.cc
                    encalg.c stream.c errors.c)

file (GLOB BTFI_HDRS Serializable.hh Codec.hh Document.hh Element.hh 
                    Attributes.hh Name.hh Value.hh MutableAttributes.hh
                    Vocabulary.hh VocabSimple.hh VocabTable.hh
                    encalg.h stream.h common.h ObjectPool.hh Exception.hh
                    include/sax.h include/names.h include/values.h
                    include/attribs.h include/vocab.h include/errors.h
                    include/fiptypes.h)

include_directories(include)
include_directories(${CMAKE_BINARY_DIR})

add_library(btfi STATIC ${BTFI_SRCS} ${BTFI_HDRS} ${CMAKE_BINARY_DIR}/autoconf.h)
add_library(libbtfi ALIAS btfi)