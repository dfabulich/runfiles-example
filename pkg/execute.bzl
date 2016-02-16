def _impl(ctx):
  executable = ctx.outputs.executable
  # Create the output executable file with command as its content.
  ctx.file_action(
      output=executable,
      content="cat data.txt",
      executable=True)

  return struct(
      # Create runfiles from the files specified in the data attribute.
      # The shell executable - the output of this rule - can use them at runtime.
      # It is also possible to define data_runfiles and default_runfiles.
      # However if runfiles is specified it's not possible to define the above
      # ones since runfiles sets them both.
      # Remember, that the struct returned by the implementation function needs
      # to have a field named "runfiles" in order to create the actual runfiles
      # symlink tree.
      runfiles=ctx.runfiles(files=ctx.files.data)
  )

execute = rule(
  implementation=_impl,
  executable=True,
  attrs={
      "data": attr.label_list(cfg=DATA_CFG, allow_files=True),
      },
)