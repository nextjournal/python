# Python script to evaluate lines streamed from stdin line by line.
# Pyton itself evaluates code from stdin not before stdin is closed,
# while this script evaluates each line immediately. Example:
#
#  for i in {1..3}; do echo "print(\"hello #$i\")"; sleep 1; done | python stream-stdin.py
#
import fileinput
import code

def __nj_evaluate_expression__(expression):
    try:
        compiled_expression = code.compile_command(expression, '<input>', 'eval')
    except SyntaxError:
        compiled_expression = code.compile_command(expression, '<input>', 'exec')
    if compiled_expression is None:
      return True
    else:
      eval(compiled_expression, globals())
      return False

def __nj_is_new_expression_without_indentation__(expression):
    return (len(expression) - len(expression.lstrip()) == 0)

__nj_pyeval_expression__ = ""
__nj_pyeval_is_incomplete_expression__ = False
for __nj_pyeval_current_line__ in fileinput.input():
    if __nj_pyeval_is_incomplete_expression__ is True:
      if __nj_is_new_expression_without_indentation__(__nj_pyeval_current_line__) is True:
        __nj_evaluate_expression__(__nj_pyeval_expression__)
        __nj_pyeval_expression__ = __nj_pyeval_current_line__
        __nj_pyeval_is_incomplete_expression__ = __nj_evaluate_expression__(__nj_pyeval_expression__)
      else: # current line is not a new expression without indentation
        __nj_pyeval_expression__ += __nj_pyeval_current_line__
    else: # last expression was complete
      __nj_pyeval_expression__ = __nj_pyeval_current_line__
      __nj_pyeval_is_incomplete_expression__ = __nj_evaluate_expression__(__nj_pyeval_expression__)
