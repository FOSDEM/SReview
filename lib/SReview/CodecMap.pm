package SReview::CodecMap;

use Exporter 'import';

our @EXPORT_OK=qw/detect_to_write/;

my %writemap = (
	'vorbis' => 'libvorbis',
);

open CHECK_FDK, "ffmpeg -hide_banner -h encoder=libfdk_aac|";
if(<CHECK_FDK> !~ /is not recognized/) {
	$writemap{aac} = 'libfdk_aac';
}
close CHECK_FDK;

sub detect_to_write($) {
	my $detected = shift;
	if(exists($writemap{$detected})) {
		return $writemap{$detected};
	} else {
		return $detected;
	}
}

1;
