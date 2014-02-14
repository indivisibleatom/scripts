use warnings;
use File::Copy;

my @fileList = ("Main.cpp", "MyWindow.cpp", "MyWindow.h", "MyWorld.cpp", "MyWorld.h", "Particle.cpp", "Particle.h");

my $pathToDownloadedSubmissions = 'C:/Users/Mukul/Desktop/AnimationTA/Galileo/Project 2 - Galileo Experiment/';
my $pathToGalileoSource = 'C:\Users\Mukul\Desktop\CS4496\apps\Galileo';
my $pathToGalileoSolution = '"C:\Users\Mukul\Desktop\CS4496\build\apps\Galileo"';
my $pathToExe = 'C:\Users\Mukul\Desktop\CS4496\build\bin\Debug';
my $exeLocation = '"C:\Users\Mukul\Desktop\CS4496\build\bin\Debug\Galileo.exe"';
my $exeLocationPerl = 'C:\Users\Mukul\Desktop\CS4496\build\bin\Debug\Galileo.exe';
my $exeName = 'Galileo';

opendir(my $rootDir, $pathToDownloadedSubmissions) or die $!;
my @files = readdir( $rootDir );
foreach $file(@files)
{
  if ( -d $file )
  {
    my $studentPath = $pathToDownloadedSubmissions.$file.'/';
    opendir( my $studentDir, $studentPath ) or die $!;
    my @studentFiles = readdir( $studentDir );
    foreach (@studentFiles)
    {
        if ($_ =~ /Submission attachment/ )
        {
          my $studentSubmitPath = $studentPath.$_.'/';
          opendir( my $studentSubmissionDir, $studentSubmitPath ) or die $!;
          my @studentSubmitFiles = readdir( $studentSubmissionDir );
          my @filesToBeCopied;
          my $fCopyAndBuild = 1;
          foreach $submittedFile(@studentSubmitFiles)
          {            
            if ($submittedFile =~ /\.cpp$|\.h$/)
            {
              if ($submittedFile ~~ @fileList)
              {
                 push(@filesToBeCopied, $submittedFile);
              }
              else
              {
                 print("Not performing copy and build for ".$studentPath."\n");
                 $fCopyAndBuild = 0;
                 last;
              }
            }
          }
          if ($fCopyAndBuild == 1)
          {
            #First clean up the existing .cpp and .h files
            unlink glob "$pathToGalileoSource/*.cpp";
            unlink glob "$pathToGalileoSource/*.h";
            unlink glob "$pathToExe/galileo.*";
            unlink "$studentSubmitPath"."$exeName.exe";
            foreach $fileToBeCopied(@filesToBeCopied)
            {
              my $filePath = $studentSubmitPath.$fileToBeCopied;
              copy($filePath, $pathToGalileoSource) or die $!;
            }
            my $buildLogLocation = '"'.$studentSubmitPath."build.log".'"';
            my $retVal = system("build.cmd $pathToGalileoSolution $buildLogLocation $exeLocation");
            if ($retVal != 0)
            {
                print("Could not build for ".$studentPath."\n");
            }
	    else
            {
                copy($exeLocationPerl, $studentSubmitPath) or die $!;
            }
          }
        }
    }
    closedir( $studentDir );
  }
}