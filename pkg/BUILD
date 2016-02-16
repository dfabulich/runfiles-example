load("/pkg/execute", "execute")

execute(
    name = "e",
    # The path to data.txt has to include the package directories as well. I.e.
    # if the BUILD file is under foo/BUILD and the data file is foo/data.txt
    # then it needs to be referred as foo/data.txt in the command.
    command = "cat data.txt",
    data = [':data.txt']
)