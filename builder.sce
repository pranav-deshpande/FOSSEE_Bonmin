// Sce file to build the toolbox(intquadprog)

mode(-1);

toolboxTitle = 'FOSSEE_Scilab_intquadprog';

path = get_absolute_file_path('builder.sce');
include_path = path + 'build/Bonmin/include/coin';
lib_path = path + 'build/Bonmin/lib';
sci_path = path + 'build/Scilab/';
cpp_path = path + 'build/cpp/';
help_dir = path + 'help/';
demos_dir = path + 'demos/';

C_Flags = [' -w -fpermissive -I ' + include_path + ' -I -Wl,-rpath=' + lib_path];
Linker_Flag = ['-L' + lib_path + 'libCoinUtils.so ' + lib_path + 'libClp.so ' + lib_path + 'libClpSolver.so ' + lib_path + 'libOsi.so ' + lib_path + 'libOsiClp.so ' + lib_path +  'libCgl.so ' + 'libCbc.so ' + lib_path + 'libCbcSolver.so ' + lib_path + 'libOsiCbc.so ' + lib_path + 'libipopt.so ' + lib_path + 'libbonmin.so '];

files = [cpp_path + 'QuadTMINLP.hpp', cpp_path + 'sci_QuadTMINLP.cpp', cpp_path + 'sci_iofunc.hpp', cpp_path + 'sci_iofunc.cpp', cpp_path + 'cpp_intqpipopt.cpp'];
functionNames = ['sci_intqpipopt', 'cpp_intqpipopt'];

tbx_build_gateway(toolboxTitle, functionNames, files, path, [], Linker_Flag, C_Flags, [], 'g++');

link(lib_path + '/libCoinUtils.so');
link(lib_path + '/libClp.so');
link(lib_path + '/libClpSolver.so');
link(lib_path + '/libOsi.so');
link(lib_path + '/libOsiClp.so');
link(lib_path + '/libCgl.so');
link(lib_path + '/libCbc.so');
link(lib_path + '/libCbcSolver.so');
link(lib_path + '/libOsiCbc.so');
link(lib_path + '/libipopt.so');

link(lib_path + '/libcoinblas.so');
link(lib_path + '/libcoinlapack.so');
link(lib_path + '/libcoinmumps.so');
link(lib_path + '/libbonmin.so');

exec (path + 'loader.sce');
exec (sci_path + 'Checktype.sci');
exec (sci_path + 'intqpipopt.sci');

help_from_sci(sci_path + 'intqpipopt.sci', help_dir, demos_dir);
xmltojar(help_dir, toolboxTitle);
add_help_chapter(toolboxTitle, help_dir);

clear WITHOUT_AUTO_PUTLHSVAR toolboxTitle functionNames files Linker_Flag C_Flags;

disp('--------------------------------------------------------------')
disp('Done')

