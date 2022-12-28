function! JavaStartVimDebugCallback(err, port)
  execute "cexpr! 'Java debug started on port: " . a:port . "'"
  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
endfunction

function JavaStartDebug()
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartVimDebugCallback'))
endfunction

function! CompileJavaDebugCallback(err, port)
  term mvn clean all
  term mvnDebug compile exec:java 
endfunction

function! CompileJavaDebug() 
    call CocActionAsync('runCommand', function('CompileJavaDebugCallback'))
endfunction

function! JavaRunCallback(err, port)
  execute "cexpr! 'Java run maven project'"
  term mvn clean all
  term mvn compile exec:java
endfunction

function! RunJavaProject()
  call CocActionAsync('runCommand', function('JavaRunCallback'))
endfunction

function! JavaTestCallback(err, port)
  execute "cexpr! 'Java test maven project'"
  term mvn test
endfunction

function! JavaTest()
  call CocActionAsync('runCommand', function('JavaTestCallback'))
endfunction

function! RunJavaCodeCallback(err, port)
  !javac %
  !java -cp  %:p:h %:t:r
endfunction

function! RunJavaCode()
  call CocActionAsync('runCommand', function('RunJavaCodeCallback'))
endfunction

function! JavaDebugCodeCallback()
  !javac %
  !java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 -cp  %:p:h %:t:r
  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartVimDebugCallback'))
endfunction

function! JavaDebugCode()
  call CocActionAsync('runCommand', function('JavaDebugCodeCallback'))
endfunction

