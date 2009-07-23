
if test -z "${QMAKE}" ; then
	if test -f /usr/bin/qmake-qt4; then
		QMAKE=qmake-qt4
	else
		QMAKE=qmake
	fi
fi

## REMEMBER: any changes below should also be applied to
## qtpaint.pro.win

echo "

## NOTE: autogenerated by createProject.sh -- do not modify!!

TEMPLATE = lib

##QT += svg
QT += opengl

# Input
HEADERS += Painter.hpp QtPainter.hpp OpenGLPainter.hpp paintUtils.hpp
HEADERS += ScenePainter.hpp QtBasePainter.hpp TestWidget.hpp
HEADERS += Layer.hpp PlotView.hpp RLayer.hpp

SOURCES += init.cpp
SOURCES += QtPainter.cpp OpenGLPainter.cpp ScenePainter.cpp QtBasePainter.cpp
SOURCES += Layer.cpp RLayer.cpp PlotView.cpp paintUtils.cpp 
SOURCES += ViewWrappers.cpp LayerWrappers.cpp SceneWrappers.cpp
SOURCES += PainterWrappers.cpp
SOURCES += TestWidget.cpp
SOURCES += imports.cpp

INCLUDEPATH += ${R_INCLUDE_DIR}
INCLUDEPATH += ${CLINK_CPPFLAGS/-I/}
CFLAGS += -g
## LIBS += -L${R_HOME/lib}


macx{
LIBS += -framework R
}
unix{
LIBS += -L${R_HOME}/lib -lR
}
win32{
LIBS += -L${R_HOME}/bin -lR
}


" > qtpaint.pro

if test `uname` == "Darwin" ; then
    ${QMAKE} -spec macx-g++ -o Makefile.qtpaint
else 
    ${QMAKE} -o Makefile.qtpaint    
fi

## if macx; do 
##     ${QMAKE} -spec macx-g++ -o Makefile.qtpaint
## else

