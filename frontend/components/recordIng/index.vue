<template>
	<div class="time-box">
		<span class="start-taste-line">
			<hr class="hr1" />
			<hr class="hr2" />
			<hr class="hr3" />
			<hr class="hr4" />
			<hr class="hr5" />
			<hr class="hr6" />
			<hr class="hr7" />
			<hr class="hr8" />
			<!-- <hr class="hr9" />
			<hr class="hr10" /> -->
		</span>
	</div>
</template>

<script>
</script>

<style scoped>
	.time-box .start-taste-line hr {
		background-color: #c8c8c8; //声波颜色
		width: 6rpx;
		height: 12rpx;
		border-radius: 1rpx;
		/* margin: 0 0.03rem 10rpx; */
		margin: 0 8rpx;
		display: inline-block;
		border: none;
	}
	hr {
		animation: note 0.4s ease-in-out;
		animation-iteration-count: infinite;
		animation-direction: alternate;
	}

	.hr1 {
		animation-delay: -1s;
	}

	.hr2 {
		animation-delay: -0.9s;
	}

	.hr3 {
		animation-delay: -0.8s;
	}

	.hr4 {
		animation-delay: -0.7s;
	}

	.hr5 {
		animation-delay: -0.6s;
	}

	.hr6 {
		animation-delay: -0.5s;
	}

	.hr7 {
		animation-delay: -0.4s;
	}

	.hr8 {
		animation-delay: -0.3s;
	}

/* 	.hr9 {
		animation-delay: -0.2s;
	}

	.hr10 {
		animation-delay: -0.1s;
	} */

	@keyframes note {
		from {
			transform: scaleY(1);
		}

		to {
			transform: scaleY(4);
		}
	}
</style>